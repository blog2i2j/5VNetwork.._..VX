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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:vx/app/outbound/outbounds_bloc.dart';
import 'package:vx/app/blocs/proxy_selector/proxy_selector_bloc.dart';
import 'package:vx/data/database.dart';
import 'package:vx/l10n/app_localizations.dart';
import 'package:vx/theme.dart';

/// A modern card widget for displaying OutboundHandler in grid view
class OutboundHandlerCard extends StatelessWidget {
  const OutboundHandlerCard({
    super.key,
    required this.handler,
    required this.jumpHighlighted,
    required this.selectedAs4,
    required this.proxySelectorMode,
    required this.showAddress,
    required this.multiSelect,
  });

  final OutboundHandler handler;
  final bool jumpHighlighted;
  final bool selectedAs4;
  final ProxySelectorMode proxySelectorMode;
  final bool showAddress;
  final bool multiSelect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRoutingSelected =
        !multiSelect &&
        (selectedAs4 ||
            (proxySelectorMode == ProxySelectorMode.manual && handler.selected));
    final isMultiSelected =
        multiSelect && handler.selectedInMultipleSelect;
    final highlightColor = theme.colorScheme.primaryContainer;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: jumpHighlighted
                ? [
                    BoxShadow(
                      color: highlightColor.withValues(alpha: 0.45),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: Card(
            elevation:
                jumpHighlighted ? 10 : (isMultiSelected || isRoutingSelected) ? 8 : 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: jumpHighlighted
                  ? BorderSide(color: highlightColor, width: 2.5)
                  : isMultiSelected
                  ? BorderSide(color: theme.colorScheme.primary, width: 2.5)
                  : isRoutingSelected
                  ? const BorderSide(color: XBlue, width: 2)
                  : BorderSide.none,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                multiSelect ? 40 : 16,
                16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: jumpHighlighted
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          highlightColor.withValues(alpha: 0.45),
                          highlightColor.withValues(alpha: 0.18),
                        ],
                      )
                    : isMultiSelected
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.12),
                          theme.colorScheme.primary.withOpacity(0.06),
                        ],
                      )
                    : isRoutingSelected
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          XBlue.withOpacity(0.1),
                          XBlue.withOpacity(0.05),
                        ],
                      )
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // Header: Country Flag + Name
                Row(
                  children: [
                    // Country Icon
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(16),
                        child: handler.countryCode.isNotEmpty
                            ? SvgPicture(
                                height: 32,
                                width: 32,
                                AssetBytesLoader(
                                  'assets/icons/flags/${handler.countryCode.toLowerCase()}.svg.vec',
                                ),
                              )
                            : const Icon(Icons.language, size: 32),
                      ),
                    ),
                    const Gap(12),
                    // Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            handler.name,
                            maxLines: 2,
                            minFontSize: 10,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isMultiSelected
                                  ? theme.colorScheme.primary
                                  : isRoutingSelected
                                  ? XBlue
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                          const Gap(2),
                          Text(
                            handler.displayProtocol(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.outline,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(16),

                // Address (Optional)
                if (showAddress) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: theme.colorScheme.outline,
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            handler.displayAddress,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              color: theme.colorScheme.outline,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                ],

                // Metrics Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Usability
                    _MetricItem(
                      head: Text(
                        AppLocalizations.of(context)!.usable,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      label: 'Status',
                      value: _getUsabilityWidget(),
                      onTap: () {
                        context.read<OutboundBloc>().add(
                          StatusTestEvent(handlers: [handler]),
                        );
                      },
                    ),

                    // Speed
                    _MetricItem(
                      head: Text(
                        AppLocalizations.of(context)!.speed,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      label: 'Speed',
                      value: handler.speedTesting
                          ? const SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              handler.ok > 0 && handler.speed > 0
                                  ? '${handler.speed.toStringAsFixed(1)}Mb'
                                  : '-',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: handler.speed > 10
                                    ? Colors.green
                                    : handler.speed > 5
                                    ? Colors.orange
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                      onTap: () {
                        context.read<OutboundBloc>().add(
                          SpeedTestEvent(handlers: [handler]),
                        );
                      },
                    ),

                    // Latency
                    _MetricItem(
                      head: Text(
                        AppLocalizations.of(context)!.latency,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      label: 'Ping',
                      value: handler.usableTesting
                          ? const SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              handler.ok > 0 && handler.ping > 0
                                  ? '${handler.ping}ms'
                                  : '-',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: handler.ping > 0 && handler.ping < 1000
                                    ? Colors.green
                                    : handler.ping >= 1000 && handler.ping < 2000
                                    ? Colors.orange
                                    : handler.ping >= 2000
                                    ? Colors.red
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                      onTap: () {
                        context.read<OutboundBloc>().add(
                          StatusTestEvent(handlers: [handler]),
                        );
                      },
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
        ),
        if (multiSelect)
          Positioned(
            top: 2,
            right: 2,
            child: Material(
              color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.92),
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 40,
                width: 40,
                child: Checkbox(
                  value: handler.selectedInMultipleSelect,
                  onChanged: (_) {
                    context.read<OutboundBloc>().add(
                      MultiSelectToggleEvent(handler),
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _getUsabilityWidget() {
    if (handler.ok == 0) {
      return const Icon(Icons.help_outline, size: 16, color: Colors.grey);
    } else if (handler.ok > 0) {
      return const Icon(Icons.check_circle, size: 16, color: Colors.green);
    } else {
      return const Icon(Icons.cancel, size: 16, color: Colors.red);
    }
  }
}

class _MetricItem extends StatelessWidget {
  const _MetricItem({
    required this.head,
    required this.label,
    required this.value,
    this.onTap,
  });

  final Widget head;
  final String label;
  final Widget value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(children: [head, const Gap(5), value]),
      ),
    );
  }
}
