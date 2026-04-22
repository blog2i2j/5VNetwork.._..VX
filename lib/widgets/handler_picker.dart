import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vx/app/outbound/outbound_page.dart';
import 'package:vx/app/outbound/outbound_repo.dart';
import 'package:vx/app/outbound/outbounds_bloc.dart';
import 'package:vx/data/database.dart';
import 'package:vx/utils/geoip.dart';

class HandlerPicker extends StatefulWidget {
  const HandlerPicker({super.key, required this.onPick});

  final ValueChanged<OutboundHandler> onPick;

  @override
  State<HandlerPicker> createState() => _HandlerPickerState();
}

class _HandlerPickerState extends State<HandlerPicker> {
  bool _isLoading = false;
  Map<String, List<OutboundHandler>> _handlersByGroup = {};

  Future<void> _loadHandlers() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    final repo = context.read<OutboundRepo>();
    final groups = context.read<OutboundBloc>().state.groups;
    final handlersByGroup = <String, List<OutboundHandler>>{};
    try {
      for (final group in groups) {
        final handlers = await repo.getHandlersByNodeGroup(group);
        handlersByGroup[group.name] = handlers
            .where((handler) => handler.config.hasOutbound())
            .toList();
      }
      if (!mounted) return;
      setState(() {
        _handlersByGroup = handlersByGroup;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final groups = context.watch<OutboundBloc>().state.groups;
    return MenuAnchor(
      onClose: () {
        _handlersByGroup.clear();
      },
      menuChildren: groups.map((group) {
        final handlers =
            _handlersByGroup[group.name] ?? const <OutboundHandler>[];
        return SubmenuButton(
          menuChildren: handlers
              .map(
                (handler) => MenuItemButton(
                  onPressed: () => widget.onPick(handler),
                  child: Row(
                    children: [
                      getCountryIcon(handler.countryCode, size: 22),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${handler.name}'),
                          Text(
                            handler.displayProtocol(),
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                  fontSize: 8,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          child: Text(groupNametoLocalizedName(context, group.name)),
        );
      }).toList(),
      builder: (context, controller, child) => Padding(
        padding: const EdgeInsets.only(left: 5),
        child: IconButton.filledTonal(
          onPressed: () async {
            await _loadHandlers();
            if (!mounted) return;
            controller.open();
          },
          style: IconButton.styleFrom(
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(0),
          ),
          icon: _isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.add_rounded, size: 18),
        ),
      ),
    );
  }
}
