// Copyright (C) 2026 5V Network LLC <5vnetwork@proton.me>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

part of 'home.dart';

class NodeInfo {
  final String id;
  final String name;
  final String serverIp;
  final Widget country;
  final OutboundHandler handler;
  NodeStats stats;
  NodeInfo({
    required this.id,
    required this.name,
    required this.serverIp,
    required this.country,
    required this.stats,
    required this.handler,
  });
}

typedef NodeStats = (int throughput, int latency, int upload, int download);
typedef DataPoint = (int value, DateTime timestamp);

const int _defaultSampleIntervalSeconds = 3;
const int _averageGroupSize = 2; // Average every N entries into one
const int _maxHistorySize = 100;

/// IDs of home widgets that use the stats stream (upload, download, memory, connections).
const Set<String> _statsWidgetIds = {
  'upload',
  'download',
  'memory',
  'connections',
};

/// Averages nearby data entries to reduce the number of points
/// Groups every [groupSize] entries and averages their values
List<DataPoint> _averageData(List<DataPoint> data, int groupSize) {
  if (data.length <= groupSize) {
    return data;
  }

  final averaged = <DataPoint>[];
  for (int i = 0; i < data.length; i += groupSize) {
    final end = (i + groupSize).clamp(0, data.length);
    final group = data.sublist(i, end);

    // Calculate average value
    final avgValue =
        (group.map((e) => e.$1).reduce((a, b) => a + b) / group.length).round();

    // Use the middle timestamp (or first if only one)
    final timestamp = group[group.length ~/ 2].$2;
    averaged.add((avgValue, timestamp));
  }

  return averaged;
}

/// Formats a DateTime for display in tooltips
String _formatTime(DateTime time) {
  final now = DateTime.now();
  final difference = now.difference(time);

  if (difference.inMinutes < 1) {
    return '${difference.inSeconds}s ago';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inDays < 1) {
    return '${difference.inHours}h ago';
  } else {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

String _formatTimeNoAgo(DateTime time) {
  final now = DateTime.now();
  final difference = now.difference(time);

  if (difference.inMinutes < 1) {
    return '${difference.inSeconds}s';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes}m';
  } else if (difference.inDays < 1) {
    return '${difference.inHours}h';
  } else {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}

class RealtimeSpeedNotifier extends ChangeNotifier {
  int? uploadSpeed;
  int? downloadSpeed;
  int? memory;
  int? connections;
  CircularBuffer<DataPoint> uploadHistory = CircularBuffer<DataPoint>(
    maxSize: _maxHistorySize,
  );
  CircularBuffer<DataPoint> downloadHistory = CircularBuffer<DataPoint>(
    maxSize: _maxHistorySize,
  );
  CircularBuffer<DataPoint> memoryHistory = CircularBuffer<DataPoint>(
    maxSize: _maxHistorySize,
  );
  CircularBuffer<DataPoint> connectionsHistory = CircularBuffer<DataPoint>(
    maxSize: _maxHistorySize,
  );
  List<NodeInfo> nodeInfos = [];

  RealtimeSpeedNotifier({
    required XController controller,
    required OutboundRepo outboundRepo,
  }) : _controller = controller,
       _outboundRepo = outboundRepo {
    _statusStream = _controller.statusStream().listen((event) async {
      if (event == XStatus.connected) {
        await _startSpeedStreamIfNeeded();
        _fetchOutboundHandlers();
        _fetchSelectedHandlers();
      } else if (event == XStatus.disconnected) {
        uploadSpeed = null;
        downloadSpeed = null;
        memory = null;
        connections = null;
        uploadHistory.clear();
        downloadHistory.clear();
        memoryHistory.clear();
        connectionsHistory.clear();
        nodeInfos.clear();
        _speedStream?.cancel();
        _speedStream = null;
        notifyListeners();
      }
    });
    _handlerBeingUsedStream = _controller.handlerBeingUsedStream().listen((
      event,
    ) {
      _selectorAndHandlers[event.selector] = event.tags.toSet();
    });
  }

  final XController _controller;
  final OutboundRepo _outboundRepo;
  StreamSubscription<StatsResponse>? _speedStream;
  StreamSubscription<XStatus>? _statusStream;
  StreamSubscription<HandlerBeingUsed>? _handlerBeingUsedStream;
  bool _statsWidgetsVisible = true;
  int _sampleIntervalSeconds = _defaultSampleIntervalSeconds;
  // selector and its selected handlers
  Map<String, Set<String>> _selectorAndHandlers = {};
  // handlers that are in outbound manager
  Set<String> _outboundHandlers = {};

  int get sampleIntervalSeconds => _sampleIntervalSeconds;

  void _fetchOutboundHandlers() async {
    final response = await _controller.outboundHandlers();
    _outboundHandlers = response.toSet();
  }

  void _fetchSelectedHandlers() async {
    final response = await _controller.selectedHandlers();
    _selectorAndHandlers = response.map(
      (key, value) => MapEntry(key, value.toSet()),
    );
  }

  /// Call when home widget visibility changes. When all stats widgets (upload,
  /// download, memory, connections) are hidden, the stats stream is cancelled.
  void setStatsWidgetsVisible(bool visible) {
    if (_statsWidgetsVisible == visible) return;
    _statsWidgetsVisible = visible;
    if (!visible) {
      _speedStream?.cancel();
      _speedStream = null;
      notifyListeners();
    } else if (_controller.status == XStatus.connected) {
      _startSpeedStreamIfNeeded();
    }
  }

  Future<void> setSampleIntervalSeconds(int seconds) async {
    final next = seconds.clamp(1, 60);
    if (_sampleIntervalSeconds == next) return;
    _sampleIntervalSeconds = next;

    if (_speedStream != null) {
      await _speedStream?.cancel();
      _speedStream = null;
      if (_statsWidgetsVisible && _controller.status == XStatus.connected) {
        await _startSpeedStreamIfNeeded();
      }
    }
    notifyListeners();
  }

  Future<void> _startSpeedStreamIfNeeded() async {
    if (!_statsWidgetsVisible || _speedStream != null) return;
    try {
      StreamSubscription<StatsResponse>? speedStream;
      speedStream =
          (await _controller.outboundStatsStream(
            _sampleIntervalSeconds,
          )).listen(
            (event) {
              _process(event);
            },
            onDone: () {
              logger.d("speed stream done");
              if (_speedStream == speedStream) {
                _speedStream = null;
              }
            },
            onError: (e) {
              logger.e("error in speed stream", error: e);
              if (_speedStream == speedStream) {
                _speedStream = null;
              }
            },
          );
      _speedStream = speedStream;
      logger.d("speed stream started");
    } catch (e) {
      logger.e("error starting speed stream", error: e);
    }
  }

  @override
  void dispose() {
    _statusStream?.cancel();
    _statusStream = null;
    _handlerBeingUsedStream?.cancel();
    _handlerBeingUsedStream = null;
    _speedStream?.cancel();
    _speedStream = null;
    super.dispose();
  }

  void demo() {
    for (var i = 0; i < 10; i++) {
      sleep(const Duration(seconds: 1));
      _process(
        StatsResponse(
          memory: Int64(1000),
          connections: 1000,
          stats: [
            OutboundStats(
              id: "node-$i",
              up: Int64(100000),
              down: Int64(10000000),
              rate: Int64(10000000),
              ping: Int64(1000000),
            ),
          ],
        ),
      );
    }
  }

  void _process(StatsResponse response) async {
    int uploadTotal = 0;
    int downloadTotal = 0;
    final now = DateTime.now();

    memory = response.memory.toInt();
    memoryHistory.add((memory!, now));
    connections = response.connections.toInt();
    connectionsHistory.add((connections!, now));

    final List<NodeInfo> newList = [];
    double interval = 0;
    for (var stat in response.stats) {
      if (stat.id == 'direct' || stat.id == 'dns') {
        continue;
      }
      interval = max(interval, stat.interval);
      uploadTotal += stat.up.toInt();
      downloadTotal += stat.down.toInt();
      int? nodeInfoIndex = nodeInfos.indexWhere(
        (element) => element.id == stat.id,
      );
      NodeInfo? nodeInfo;
      final iv = stat.interval;
      final upRate = iv > 0 ? (stat.up.toInt() / iv).round() : 0;
      final downRate = iv > 0 ? (stat.down.toInt() / iv).round() : 0;
      final stats = (stat.rate.toInt(), stat.ping.toInt(), upRate, downRate);
      // if it is not currently selected or in outbound handlers, do not show the node
      if (!_selectorAndHandlers.values.any(
            (element) => element.contains(stat.id),
          ) &&
          !_outboundHandlers.contains(stat.id)) {
        continue;
      }
      if (nodeInfoIndex < 0) {
        final name = await _outboundRepo.getHandlerName(stat.id);
        late OutboundHandler handler;
        if (stat.id.contains('-')) {
          final h = (await _outboundRepo.getHandlerById(
            int.parse(stat.id.split('-').last),
          ));
          if (h != null) {
            handler = h;
          } else {
            logger.w("handler not found: ${stat.id}");
            continue;
          }
        } else {
          handler = (await _outboundRepo.getHandlerById(int.parse(stat.id)))!;
        }
        nodeInfo = NodeInfo(
          id: stat.id,
          name: name,
          serverIp: handler.serverIp.isEmpty
              ? handler.address
              : handler.serverIp,
          country: handler.countryIcon,
          stats: stats,
          handler: handler,
        );
        newList.add(nodeInfo);
      } else {
        nodeInfo = nodeInfos[nodeInfoIndex];
        // if no data for two intervals and not in selected handlers and outbound handlers
        // do not show the node
        // if (nodeInfo.stats.$3 == 0 &&
        //     nodeInfo.stats.$4 == 0 &&
        //     stats.$3 == 0 &&
        //     stats.$4 == 0 &&
        //     !_selectorAndHandlers.values.any(
        //       (element) => element.contains(nodeInfo!.id),
        //     ) &&
        //     !_outboundHandlers.contains(nodeInfo.id)) {
        //   continue;
        // }
        nodeInfo.stats = stats;
        newList.add(nodeInfo);
      }
    }
    if (interval > 0) {
      uploadSpeed = uploadTotal ~/ interval;
      uploadHistory.add((uploadSpeed!, now));
      downloadSpeed = downloadTotal ~/ interval;
      downloadHistory.add((downloadSpeed!, now));
    }

    newList.sort((a, b) => b.name.compareTo(a.name));
    nodeInfos = newList;
    notifyListeners();
  }
}

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    final visibility = context.watch<StandardHomeWidgetVisibilityNotifier>();
    final hidden = visibility.hiddenIds;
    final showUpload = !hidden.contains(HomeWidgetId.upload.id);
    final showDownload = !hidden.contains(HomeWidgetId.download.id);
    final showMemory = !hidden.contains(HomeWidgetId.memory.id);
    final showConnections = !hidden.contains(HomeWidgetId.connections.id);
    if (!showUpload && !showDownload && !showMemory && !showConnections) {
      return const SizedBox();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = constraints.maxWidth > 800 ? 4 : 2;
        final ratio = ((constraints.maxWidth - 30) / count) / 90;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: ratio,
            crossAxisCount: count,
            children: [
              if (showUpload) const RealtimeSpeed(isUpload: true),
              if (showDownload) const RealtimeSpeed(isUpload: false),
              if (showMemory) const MemoryStats(),
              if (showConnections) const ConnectionsStats(),
            ],
          ),
        );
      },
    );
  }
}

class RealtimeSpeed extends StatefulWidget {
  const RealtimeSpeed({super.key, required this.isUpload});

  final bool isUpload;

  @override
  State<RealtimeSpeed> createState() => _RealtimeSpeedState();
}

class _RealtimeSpeedState extends State<RealtimeSpeed> {
  bool _showChart = false;

  void _toggleView() {
    if (context.read<MyLayout>().isCompact) {
      showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: _SpeedChart(
              key: const ValueKey('chart'),
              bottomSheet: true,
              isUpload: widget.isUpload,
              color: widget.isUpload ? XPink : XBlue,
            ),
          ),
        ),
      );
    } else {
      setState(() {
        _showChart = !_showChart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.isUpload ? XPink : XBlue;
    return GestureDetector(
      onTap: _toggleView,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        // width: 180,
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _showChart
            ? _SpeedChart(
                key: const ValueKey('chart'),
                isUpload: widget.isUpload,
                color: color,
              )
            : _SpeedDisplay(
                key: const ValueKey('display'),
                isUpload: widget.isUpload,
                color: color,
              ),
      ),
    );
  }
}

class _SpeedDisplay extends StatelessWidget {
  const _SpeedDisplay({super.key, required this.isUpload, required this.color});

  final bool isUpload;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Label row with icon
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                isUpload ? Icons.arrow_upward : Icons.arrow_downward,
                color: color,
                size: 14,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                isUpload
                    ? AppLocalizations.of(context)!.upload
                    : AppLocalizations.of(context)!.download,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        // Speed value
        Consumer<RealtimeSpeedNotifier>(
          builder: (ctx, speedProvider, child) {
            final speed = isUpload
                ? (demo ? 100000 : speedProvider.uploadSpeed)
                : (demo ? 10000000 : speedProvider.downloadSpeed);
            final speedText = speed != null ? bytesToReadable(speed) : '--';
            return Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Flexible(
                  child: Text(
                    speedText,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: color,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      letterSpacing: -0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                if (speed != null) child!,
              ],
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              '/s',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withOpacity(0.7),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SpeedChart extends StatelessWidget {
  const _SpeedChart({
    super.key,
    required this.isUpload,
    required this.color,
    this.bottomSheet = false,
  });

  final bool isUpload;
  final Color color;
  final bool bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Consumer<RealtimeSpeedNotifier>(
      builder: (context, speedProvider, _) {
        final history = isUpload
            ? speedProvider.uploadHistory
            : speedProvider.downloadHistory;

        final speed = isUpload
            ? speedProvider.uploadSpeed
            : speedProvider.downloadSpeed;
        final speedText = speed != null ? bytesToReadable(speed) : '--';

        if (history.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noData,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        List<(int, DateTime)> allData = history.toList();
        // Calculate max value for display
        final maxValue = allData.isNotEmpty
            ? allData.toList().map((e) => e.$1).reduce((a, b) => a > b ? a : b)
            : 0;
        final maxValueText = maxValue > 0 ? bytesToReadable(maxValue) : '--';
        // allData = _averageData(allData, _averageGroupSize);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isUpload ? Icons.arrow_upward : Icons.arrow_downward,
                  color: color,
                  size: 14,
                ),
                const SizedBox(width: 6),
                Text(
                  speedText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  'Max: $maxValueText',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: LineChart(
                _buildSpeedChartData(
                  allData,
                  color,
                  maxValue,
                  context,
                  bottomSheet,
                ),
                duration: Duration.zero, // Remove animation to prevent shaking
                curve: Curves.easeInOut,
              ),
            ),
          ],
        );
      },
    );
  }

  LineChartData _buildSpeedChartData(
    List<(int, DateTime)> allData,
    Color color,
    int maxValue,
    BuildContext context,
    bool bottomSheet,
  ) {
    if (allData.isEmpty) {
      return LineChartData(
        lineBarsData: [],
        minX: 0,
        maxX: 1,
        minY: 0,
        maxY: 100,
      );
    }

    // Average data to reduce number of points
    final spots = allData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.$1.toDouble());
    }).toList();

    // Align the top tick with the actual max speed so we can show
    // exactly 3 Y labels: min / mid / max.
    final maxY = maxValue.toDouble().clamp(1.0, double.infinity);
    const minY = 0.0;
    final maxX = (allData.length - 1).toDouble().clamp(1.0, double.infinity);
    final yInterval = (maxY - minY) / 2.0;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: maxY / 3,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: bottomSheet ? true : false,
            interval: maxX / 2.0,
            getTitlesWidget: (value, meta) {
              final idx = value.round().clamp(0, allData.length - 1);
              final ts = allData[idx].$2;
              // Use "how long ago" style (same as tooltip), but keep font small.
              return Center(
                child: Text(
                  _formatTimeNoAgo(ts),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 9,
                  ),
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: bottomSheet ? true : false,
            interval: yInterval <= 0 ? 1.0 : yInterval, // min / mid / max
            reservedSize: 22,
            getTitlesWidget: (value, meta) {
              // Only render exactly 3 labels: min, mid, max.
              final eps = (yInterval.abs() * 0.001).clamp(1e-9, 1e9);
              final isMin = (value - minY).abs() < eps;
              final isMid = (value - (minY + maxY) / 2.0).abs() < eps;
              final isMax = (value - maxY).abs() < eps;
              if (!isMin && !isMid && !isMax) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: AutoSizeText(
                  bytesToReadableCompact(value.round()),
                  maxLines: 1,
                  minFontSize: 7,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 9,
                  ),
                ),
              );
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: color,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: color.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color.withOpacity(0.2), color.withOpacity(0.0)],
            ),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => color,
          tooltipPadding: const EdgeInsets.all(6),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              final index = touchedSpot.x.toInt();
              if (index >= 0 && index < allData.length) {
                final dataPoint = allData[index];
                final timeStr = _formatTime(dataPoint.$2);
                return LineTooltipItem(
                  '${bytesToReadable(touchedSpot.y.toInt())}\n$timeStr',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              }
              return LineTooltipItem(
                bytesToReadable(touchedSpot.y.toInt()),
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class MemoryStats extends StatefulWidget {
  const MemoryStats({super.key});

  @override
  State<MemoryStats> createState() => _MemoryStatsState();
}

class _MemoryStatsState extends State<MemoryStats> {
  bool _showChart = false;

  void _toggleView() {
    setState(() {
      _showChart = !_showChart;
    });
  }

  @override
  Widget build(BuildContext context) {
    const color = ShimmerPurple;
    return GestureDetector(
      onTap: _toggleView,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        // width: 180,
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _showChart
            ? const _MemoryChart(key: ValueKey('chart'), color: color)
            : const _MemoryDisplay(key: ValueKey('display'), color: color),
      ),
    );
  }
}

class _MemoryDisplay extends StatelessWidget {
  const _MemoryDisplay({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.memory, color: color, size: 14),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.memory,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Consumer<RealtimeSpeedNotifier>(
          builder: (ctx, speedProvider, child) {
            final memory = demo ? 10000000 : speedProvider.memory;
            final memoryText = memory != null ? bytesToReadable(memory) : '--';
            return Text(
              memoryText,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.0,
                letterSpacing: -0.5,
              ),
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ],
    );
  }
}

class _MemoryChart extends StatelessWidget {
  const _MemoryChart({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Consumer<RealtimeSpeedNotifier>(
      builder: (context, speedProvider, _) {
        final history = speedProvider.memoryHistory;
        final memory = speedProvider.memory;
        final memoryText = memory != null ? bytesToReadable(memory) : '--';
        if (history.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noData,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.memory, color: color, size: 14),
                const SizedBox(width: 6),
                Text(
                  memoryText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: LineChart(
                _buildMemoryChartData(history, color),
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
              ),
            ),
          ],
        );
      },
    );
  }

  LineChartData _buildMemoryChartData(
    CircularBuffer<DataPoint> history,
    Color color,
  ) {
    final allData = history.toList();
    if (allData.isEmpty) {
      return LineChartData(
        lineBarsData: [],
        minX: 0,
        maxX: 1,
        minY: 0,
        maxY: 100,
      );
    }

    // Average data to reduce number of points
    final averagedData = _averageData(allData, _averageGroupSize);
    final spots = averagedData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.$1.toDouble());
    }).toList();

    final maxValue = averagedData
        .map((e) => e.$1)
        .reduce((a, b) => a > b ? a : b);
    final maxY = (maxValue * 1.1).toDouble().clamp(1.0, double.infinity);
    const minY = 0.0;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: maxY / 3,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
        },
      ),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: (averagedData.length - 1).toDouble().clamp(1.0, double.infinity),
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: color,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: color.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color.withOpacity(0.2), color.withOpacity(0.0)],
            ),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => color,
          tooltipPadding: const EdgeInsets.all(6),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              final index = touchedSpot.x.toInt();
              if (index >= 0 && index < averagedData.length) {
                final dataPoint = averagedData[index];
                final timeStr = _formatTime(dataPoint.$2);
                return LineTooltipItem(
                  '${bytesToReadable(touchedSpot.y.toInt())}\n$timeStr',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              }
              return LineTooltipItem(
                bytesToReadable(touchedSpot.y.toInt()),
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class ConnectionsStats extends StatefulWidget {
  const ConnectionsStats({super.key});

  @override
  State<ConnectionsStats> createState() => _ConnectionsStatsState();
}

class _ConnectionsStatsState extends State<ConnectionsStats> {
  bool _showChart = false;
  final color = ShimmerGreen.withOpacity(0.9);

  void _toggleView() {
    if (context.read<MyLayout>().isCompact) {
      showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: _ConnectionsChart(
              key: const ValueKey('chart'),
              color: color,
              bottomSheet: true,
            ),
          ),
        ),
      );
    } else {
      setState(() {
        _showChart = !_showChart;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleView,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _showChart
            ? _ConnectionsChart(key: const ValueKey('chart'), color: color)
            : _ConnectionsDisplay(key: const ValueKey('display'), color: color),
      ),
    );
  }
}

class _ConnectionsDisplay extends StatelessWidget {
  const _ConnectionsDisplay({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.route_outlined, color: color, size: 14),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.connections,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Consumer<RealtimeSpeedNotifier>(
          builder: (ctx, speedProvider, child) {
            final connections = demo
                ? '37'
                : (speedProvider.connections != null
                      ? speedProvider.connections.toString()
                      : '--');
            return Text(
              connections,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.0,
                letterSpacing: -0.5,
              ),
              overflow: TextOverflow.ellipsis,
            );
          },
        ),
      ],
    );
  }
}

class _ConnectionsChart extends StatelessWidget {
  const _ConnectionsChart({
    super.key,
    required this.color,
    this.bottomSheet = false,
  });

  final Color color;
  final bool bottomSheet;
  @override
  Widget build(BuildContext context) {
    return Consumer<RealtimeSpeedNotifier>(
      builder: (context, speedProvider, _) {
        final history = speedProvider.connectionsHistory;
        final connections = speedProvider.connections != null
            ? speedProvider.connections.toString()
            : '--';
        if (history.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noData,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.route_outlined, color: color, size: 14),
                const SizedBox(width: 6),
                Text(
                  connections,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: LineChart(
                _buildConnectionsChartData(
                  history,
                  color,
                  bottomSheet,
                  context,
                ),
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
              ),
            ),
          ],
        );
      },
    );
  }

  LineChartData _buildConnectionsChartData(
    CircularBuffer<DataPoint> history,
    Color color,
    bool bottomSheet,
    BuildContext context,
  ) {
    final allData = history.toList();
    if (allData.isEmpty) {
      return LineChartData(
        lineBarsData: [],
        minX: 0,
        maxX: 1,
        minY: 0,
        maxY: 100,
      );
    }

    // Average data to reduce number of points
    final spots = allData.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.$1.toDouble());
    }).toList();

    final maxValue = allData.map((e) => e.$1).reduce((a, b) => a > b ? a : b);
    final maxY = maxValue.toDouble().clamp(1.0, double.infinity);
    const minY = 0.0;
    final maxX = (allData.length - 1).toDouble().clamp(1.0, double.infinity);
    final yInterval = (maxY - minY) / 2.0;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: maxY / 3,
        getDrawingHorizontalLine: (value) {
          // Show max line when bottomSheet is true
          if (bottomSheet && (value - maxY).abs() < 0.001) {
            return FlLine(
              color: color.withOpacity(0.5),
              strokeWidth: 2,
              dashArray: [5, 5],
            );
          }
          return FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: bottomSheet ? true : false,
            reservedSize: bottomSheet ? 20 : 12,
            interval: maxX / 2.0,
            getTitlesWidget: (value, meta) {
              final idx = value.round().clamp(0, allData.length - 1);
              final ts = allData[idx].$2;
              return Center(
                child: Text(
                  _formatTimeNoAgo(ts),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 9,
                  ),
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: bottomSheet ? true : false,
            interval: yInterval <= 0 ? 1.0 : yInterval, // min / mid / max
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              // Only render exactly 3 labels: min, mid, max.
              final eps = (yInterval.abs() * 0.001).clamp(1e-9, 1e9);
              final isMin = (value - minY).abs() < eps;
              final isMid = (value - (minY + maxY) / 2.0).abs() < eps;
              final isMax = (value - maxY).abs() < eps;
              if (!isMin && !isMid && !isMax) return const SizedBox.shrink();

              return Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: AutoSizeText(
                  value.round().toString(),
                  maxLines: 1,
                  minFontSize: 7,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 9,
                  ),
                ),
              );
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border(
          bottom: BorderSide(
            color: bottomSheet
                ? Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3)
                : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: color,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: color.withOpacity(0.1),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color.withOpacity(0.2), color.withOpacity(0.0)],
            ),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => color,
          tooltipPadding: const EdgeInsets.all(6),
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              final index = touchedSpot.x.toInt();
              if (index >= 0 && index < allData.length) {
                final dataPoint = allData[index];
                final timeStr = _formatTime(dataPoint.$2);
                return LineTooltipItem(
                  '${touchedSpot.y.toInt()}\n$timeStr',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              }
              return LineTooltipItem(
                touchedSpot.y.toInt().toString(),
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class NodeStatsWidget extends StatelessWidget {
  const NodeStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RealtimeSpeedNotifier>(
      builder: (context, speedProvider, _) {
        if (speedProvider.nodeInfos.isEmpty) {
          return const SizedBox();
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outlineVariant.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
            itemCount: speedProvider.nodeInfos.length,
            itemBuilder: (context, index) {
              final nodeInfo = speedProvider.nodeInfos[index];
              return NodeCard(nodeInfo: nodeInfo);
            },
          ),
        );
      },
    );
  }
}

class NodeCard extends StatefulWidget {
  const NodeCard({super.key, required this.nodeInfo});
  final NodeInfo nodeInfo;

  @override
  State<NodeCard> createState() => _NodeCardState();
}

class _NodeCardState extends State<NodeCard> {
  // String? _selectedChartType; // 'rate', 'upload', 'download', 'latency'

  // void _toggleChart(String type) {
  //   setState(() {
  //     _selectedChartType = _selectedChartType == type ? null : type;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final latestStats = widget.nodeInfo.stats;
    final throughput = latestStats.$1;
    final latency = latestStats.$2;
    final uploadSpeed = latestStats.$3;
    final downloadSpeed = latestStats.$4;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  int? handlerId;
                  if (widget.nodeInfo.id.contains('-')) {
                    handlerId = int.tryParse(
                      widget.nodeInfo.id.split('-').last,
                    );
                  } else {
                    handlerId = int.tryParse(widget.nodeInfo.id);
                  }
                  GoRouter.of(context).go(
                    '/node',
                    extra: NodePageExtra(initialHandlerId: handlerId),
                  );
                },
                child: // Header: Country flag + Name + IP
                Row(
                  children: [
                    // Country flag
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: widget.nodeInfo.country,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Node info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nodeInfo.name,
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${widget.nodeInfo.serverIp} · ${widget.nodeInfo.handler.displayProtocol()}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                fontSize: 10,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            if (constraints.maxWidth < 300) ...[
              Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.realtimeRate,
                      value: bytesToReadable(throughput),
                      icon: Icons.speed,
                      color: ShimmerPurple,
                      isSelected: false /*  _selectedChartType == 'rate' */,
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              AppLocalizations.of(context)!.realtimeRateDesc,
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.realtimeLatency,
                      value: latency > 0 ? '${latency}ms' : '--',
                      icon: Icons.network_check,
                      color: VioletBlue,
                      isSelected: false /* _selectedChartType == 'latency' */,
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              AppLocalizations.of(context)!.realtimeLatencyDesc,
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.upload,
                      value: bytesToReadable(uploadSpeed),
                      icon: Icons.arrow_upward_rounded,
                      color: XPink,
                      isSelected: false,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.download,
                      value: bytesToReadable(downloadSpeed),
                      icon: Icons.arrow_downward_rounded,
                      color: XBlue,
                      isSelected: false,
                    ),
                  ),
                ],
              ),
            ],
            if (constraints.maxWidth >= 300)
              // Stats grid
              Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.realtimeRate,
                      value: bytesToReadable(throughput),
                      icon: Icons.speed,
                      color: ShimmerPurple,
                      isSelected: false /*  _selectedChartType == 'rate' */,
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              AppLocalizations.of(context)!.realtimeRateDesc,
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.realtimeLatency,
                      value: latency > 0 ? '${latency}ms' : '--',
                      icon: Icons.network_check,
                      color: VioletBlue,
                      isSelected: false /* _selectedChartType == 'latency' */,
                      onTap: () => {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                              AppLocalizations.of(context)!.realtimeLatencyDesc,
                            ),
                          ),
                        ),
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.upload,
                      value: bytesToReadable(uploadSpeed),
                      icon: Icons.arrow_upward_rounded,
                      color: XPink,
                      isSelected: false,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _StatItem(
                      label: AppLocalizations.of(context)!.download,
                      value: bytesToReadable(downloadSpeed),
                      icon: Icons.arrow_downward_rounded,
                      color: XBlue,
                      isSelected: false,
                    ),
                  ),
                ],
              ),
            // // Chart area
            // if (_selectedChartType != null) ...[
            //   const SizedBox(height: 16),
            //   Container(
            //     height: 120,
            //     padding: const EdgeInsets.all(12),
            //     margin: const EdgeInsets.symmetric(horizontal: 0),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.surface,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: _NodeChart(
            //       nodeInfo: widget.nodeInfo,
            //       chartType: _selectedChartType!,
            //     ),
            //   ),
            // ],
            // const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.isSelected,
    this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final box = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? color.withOpacity(0.15)
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected
              ? color.withOpacity(0.5)
              : Theme.of(context).colorScheme.outlineVariant.withOpacity(0.2),
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
    if (onTap == null) return box;
    return GestureDetector(onTap: onTap, child: box);
  }
}

// class _NodeChart extends StatelessWidget {
//   const _NodeChart({required this.nodeInfo, required this.chartType});

//   final NodeInfo nodeInfo;
//   final String chartType;

//   @override
//   Widget build(BuildContext context) {
//     if (nodeInfo.statsHistory.isEmpty) {
//       return Center(
//         child: Text(
//           'No data',
//           style: Theme.of(context).textTheme.bodySmall?.copyWith(
//             color: Theme.of(context).colorScheme.onSurfaceVariant,
//           ),
//         ),
//       );
//     }

//     Color color;
//     String label;
//     List<int> dataValues;

//     switch (chartType) {
//       case 'rate':
//         color = ShimmerPurple;
//         label = AppLocalizations.of(context)!.realtimeRate;
//         break;
//       // case 'upload':
//       //   color = XPink;
//       //   label = AppLocalizations.of(context)!.upload;
//       //   dataValues = nodeInfo.statsHistory.toList().map((e) => e.$3).toList();
//       //   break;
//       // case 'download':
//       //   color = XBlue;
//       //   label = AppLocalizations.of(context)!.download;
//       //   dataValues = nodeInfo.statsHistory.toList().map((e) => e.$4).toList();
//       //   break;
//       case 'latency':
//         color = VioletBlue;
//         label = AppLocalizations.of(context)!.realtimeLatency;
//         break;
//       default:
//         color = Colors.grey;
//         label = '';
//         dataValues = [];
//     }

//     return LineChart(
//       _buildNodeChartData(
//         dataValues,
//         color,
//         label == AppLocalizations.of(context)!.realtimeLatency,
//       ),
//       duration: const Duration(milliseconds: 150),
//       curve: Curves.easeInOut,
//     );
//   }

//   LineChartData _buildNodeChartData(
//     List<int> dataValues,
//     Color color,
//     bool isLatency,
//   ) {
//     if (dataValues.isEmpty) {
//       return LineChartData(
//         lineBarsData: [],
//         minX: 0,
//         maxX: 1,
//         minY: 0,
//         maxY: 100,
//       );
//     }

//     // Average data to reduce number of points
//     final averagedValues = <int>[];
//     for (int i = 0; i < dataValues.length; i += _averageGroupSize) {
//       final end = (i + _averageGroupSize).clamp(0, dataValues.length);
//       final group = dataValues.sublist(i, end);
//       final avgValue = (group.reduce((a, b) => a + b) / group.length).round();
//       averagedValues.add(avgValue);
//     }

//     final spots = averagedValues.asMap().entries.map((entry) {
//       return FlSpot(entry.key.toDouble(), entry.value.toDouble());
//     }).toList();

//     final maxValue = averagedValues.reduce((a, b) => a > b ? a : b);
//     final maxY = (maxValue * 1.1).toDouble().clamp(1.0, double.infinity);
//     const minY = 0.0;

//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: false,
//         horizontalInterval: maxY / 3,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(color: Colors.grey.withOpacity(0.1), strokeWidth: 1);
//         },
//       ),
//       titlesData: const FlTitlesData(show: false),
//       borderData: FlBorderData(show: false),
//       minX: 0,
//       maxX: (averagedValues.length - 1).toDouble().clamp(1.0, double.infinity),
//       minY: minY,
//       maxY: maxY,
//       lineBarsData: [
//         LineChartBarData(
//           spots: spots,
//           isCurved: true,
//           color: color,
//           barWidth: 2,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(show: false),
//           belowBarData: BarAreaData(
//             show: true,
//             color: color.withOpacity(0.1),
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [color.withOpacity(0.2), color.withOpacity(0.0)],
//             ),
//           ),
//         ),
//       ],
//       lineTouchData: LineTouchData(
//         enabled: true,
//         touchTooltipData: LineTouchTooltipData(
//           getTooltipColor: (_) => color,
//           tooltipPadding: const EdgeInsets.all(6),
//           getTooltipItems: (List<LineBarSpot> touchedSpots) {
//             return touchedSpots.map((touchedSpot) {
//               final valueStr = isLatency
//                   ? '${touchedSpot.y.toInt()}ms'
//                   : bytesToReadable(touchedSpot.y.toInt());
//               return LineTooltipItem(
//                 valueStr,
//                 const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 10,
//                 ),
//               );
//             }).toList();
//           },
//         ),
//       ),
//     );
//   }
// }
