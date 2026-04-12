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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vx/app/outbound/outbounds_bloc.dart';
import 'package:vx/app/server/deployer.dart';
import 'package:vx/app/server/server_page.dart';
import 'package:vx/app/server/vx_bloc.dart';
import 'package:vx/app/server/vx_config.dart';
import 'package:vx/app/server/vx_status.dart';
import 'package:vx/common/extension.dart';
import 'package:vx/common/version.dart';
import 'package:vx/data/database.dart';
import 'package:vx/main.dart';
import 'package:vx/utils/logger.dart';
import 'package:vx/l10n/app_localizations.dart';
import 'package:vx/utils/xapi_client.dart';
import 'package:vx/widgets/circular_progress_indicator.dart';
import 'package:vx/widgets/form_dialog.dart';

class ServerDetail extends StatefulWidget {
  const ServerDetail({
    super.key,
    required this.server,
    this.fullScreen = false,
  });
  final SshServer server;
  final bool fullScreen;
  @override
  State<ServerDetail> createState() => _ServerDetailState();
}

enum ServerDetailSegment { overview, vx }

class _ServerDetailState extends State<ServerDetail> {
  ServerDetailSegment _segment = ServerDetailSegment.overview;

  @override
  Widget build(BuildContext context) {
    final body = Material(
      child: Center(
        child: BlocProvider(
          create: (context) => VXBloc(
            xapiClient: context.read<XApiClient>(),
            server: widget.server,
            outboundBloc: context.read<OutboundBloc>(),
          )..add(VXBlocInitialEvent()),
          child: Builder(
            builder: (context) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          if (!widget.fullScreen)
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                              ),
                            ),
                          const Spacer(),
                          SegmentedButton<ServerDetailSegment>(
                            segments: [
                              ButtonSegment(
                                value: ServerDetailSegment.overview,
                                label: Text(
                                  AppLocalizations.of(context)!.overview,
                                ),
                              ),
                              ButtonSegment(
                                value: ServerDetailSegment.vx,
                                label: Text(
                                  AppLocalizations.of(context)!.vxCoreConfig,
                                ),
                              ),
                            ],
                            selected: {_segment},
                            onSelectionChanged:
                                (Set<ServerDetailSegment> set) => setState(() {
                                  _segment = set.first;
                                }),
                          ),
                          const Spacer(),
                          const SizedBox(width: 40),
                        ],
                      ),
                      const Gap(10),
                      Expanded(
                        child: IndexedStack(
                          index: _segment.index,
                          children: [
                            _Overview(server: widget.server),
                            const _VX(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const _UnsavedChangesBar(),
                ],
              );
            },
          ),
        ),
      ),
    );
    if (widget.fullScreen) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.server.name)),
        body: body,
      );
    }
    return body;
  }
}

class _Overview extends StatefulWidget {
  const _Overview({required this.server});
  final SshServer server;

  @override
  State<_Overview> createState() => _OverviewState();
}

class _OverviewState extends State<_Overview> {
  final GlobalKey _serverStatusKey = GlobalKey();
  bool _shownOldVersionDialog = false;

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.of(context).size.isCompact;
    return BlocListener<VXBloc, VXState>(
      listenWhen: (previous, current) =>
          !_shownOldVersionDialog && current is VXInstalledState,
      listener: (context, state) {
        if (state is VXInstalledState &&
            !versionNewerThan(state.version, "1.1.1") &&
            !_shownOldVersionDialog) {
          _shownOldVersionDialog = true;
          final l10n = AppLocalizations.of(context);
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Text(
                l10n?.vxVersionTooLow ??
                    'This version is too low, please update.',
              ),
              actions: [
                FilledButton.tonal(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(AppLocalizations.of(ctx)!.close),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<VXBloc>().add(VXUpdateEvent());
                    Navigator.of(ctx).pop();
                  },
                  child: Text(AppLocalizations.of(ctx)!.update),
                ),
              ],
            ),
          );
        }
      },
      child: Column(
        children: [
          if (isCompact)
            Container(
              height: 174,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 290,
                      child: Hero(
                        tag: 'server${widget.server.id}',
                        child: ServerCard(
                          server: widget.server,
                          showStatus: true,
                          serverStatusKey: _serverStatusKey,
                        ),
                      ),
                    ),
                    const Gap(10),
                    const SizedBox(width: 290, child: VXServiceStatus()),
                  ],
                ),
              ),
            )
          else
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: 290,
                  height: 174,
                  child: Hero(
                    tag: 'server${widget.server.id}',
                    child: ServerCard(
                      server: widget.server,
                      showStatus: true,
                      serverStatusKey: _serverStatusKey,
                    ),
                  ),
                ),
                const Gap(10),
                const SizedBox(
                  width: 290,
                  height: 174,
                  child: VXServiceStatus(),
                ),
                const Spacer(),
              ],
            ),
          const Gap(10),
          Expanded(child: QuickDeploy(server: widget.server)),
        ],
      ),
    );
  }
}

class _VX extends StatelessWidget {
  const _VX();

  @override
  Widget build(BuildContext context) {
    return const VXConfig();
  }
}

class ServerActionButtons extends StatefulWidget {
  const ServerActionButtons({super.key, required this.server});
  final SshServer server;

  @override
  State<ServerActionButtons> createState() => _ServerActionButtonsState();
}

class _ServerActionButtonsState extends State<ServerActionButtons> {
  bool _isShuttingDown = false;
  bool _isRestarting = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _isShuttingDown
            ? const SizedBox(
                width: 32,
                height: 32,
                child: Center(
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              )
            : IconButton(
                iconSize: 16,
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                onPressed: () async {
                  setState(() {
                    _isShuttingDown = true;
                  });
                  try {
                    await context.read<XApiClient>().shutdownServer(
                      widget.server,
                    );
                  } catch (e) {
                    logger.d('shutdown server error', error: e);
                  } finally {
                    setState(() {
                      _isShuttingDown = false;
                    });
                  }
                },
                icon: const Icon(Icons.power_settings_new_rounded),
              ),
        _isRestarting
            ? const SizedBox(
                width: 32,
                height: 32,
                child: Center(
                  child: SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              )
            : IconButton(
                iconSize: 16,
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                onPressed: () async {
                  setState(() {
                    _isRestarting = true;
                  });
                  try {
                    await context.read<XApiClient>().restartServer(
                      widget.server,
                    );
                  } catch (e) {
                    logger.d('restart server error', error: e);
                  } finally {
                    setState(() {
                      _isRestarting = false;
                    });
                  }
                },
                icon: const Icon(Icons.restart_alt_rounded),
              ),
        // IconButton(
        //     iconSize: 16,
        //     constraints: const BoxConstraints(
        //       minWidth: 16,
        //       minHeight: 16,
        //     ),
        //     onPressed: () {},
        //     icon: const Icon(Icons.pause_rounded))
      ],
    );
  }
}

class QuickDeploy extends StatefulWidget {
  const QuickDeploy({super.key, required this.server});
  final SshServer server;

  @override
  State<QuickDeploy> createState() => _QuickDeployState();
}

class _QuickDeployState extends State<QuickDeploy> {
  final List<QuickDeployOption> options = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final xapiClient = context.read<XApiClient>();
    final storage = context.read<FlutterSecureStorage>();
    options.addAll([
      AllInOneQuickDeploy(xApiClient: xapiClient),
      BasicQuickDeploy(storage: storage, xApiClient: xapiClient),
      MasqueradeQuickDeploy(xApiClient: xapiClient),
    ]);
  }

  void _showDetails(BuildContext context, QuickDeployOption option) async {
    final outboundBloc = context.read<OutboundBloc>();
    final vxBloc = context.read<VXBloc>();
    final deployer = context.read<Deployer>();
    final formKey = GlobalKey<FormState>();
    final result = await showMyAdaptiveDialog<bool?>(
      context,
      Form(
        key: formKey,
        child: QuickDeployOptionDetial(
          option: option,
          destination: widget.server.address,
        ),
      ),
      saveText: AppLocalizations.of(context)!.deploy,
      onSave: (BuildContext ctx) {
        if (formKey.currentState?.validate() != true) {
          return;
        }
        Navigator.of(ctx).pop(true);
      },
    );
    if (result == true) {
      try {
        final deployResult = await deployer.deploy(widget.server, option);
        outboundBloc.add(AddHandlersEvent(deployResult.handlerConfigs));
        if (option is AllInOneQuickDeploy) {
          vxBloc.add(VXReloadConfigEvent());
        }

        // Show success dialog with any warnings
        final hasWarnings =
            deployResult.bbrError.isNotEmpty ||
            deployResult.firewallError.isNotEmpty;
        final warnings = <String>[];
        if (deployResult.bbrError.isNotEmpty) {
          warnings.add(
            rootLocalizations()?.bbrError(deployResult.bbrError) ??
                'BBR failed to enable',
          );
        }
        if (deployResult.firewallError.isNotEmpty) {
          warnings.add(
            rootLocalizations()?.firewallError(deployResult.firewallError) ??
                'Firewall failed to disable',
          );
        }

        if (rootNavigationKey.currentState?.mounted == true) {
          showDialog(
            context: rootNavigationKey.currentState!.context,
            builder: (context) => AlertDialog(
              icon: Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                hasWarnings
                    ? AppLocalizations.of(context)!.deploySuccessWarnings
                    : AppLocalizations.of(context)!.deploySuccess(
                        option.getTitle(context),
                        widget.server.name,
                      ),
              ),
              content: hasWarnings
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...warnings.map(
                          (warning) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                const Gap(8),
                                Expanded(
                                  child: Text(
                                    warning,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          );
        }
      } catch (e) {
        if (rootNavigationKey.currentState?.mounted == true) {
          showDialog(
            context: rootNavigationKey.currentState!.context,
            builder: (context) => AlertDialog(
              icon: Icon(
                Icons.error_outline_rounded,
                color: Theme.of(context).colorScheme.error,
                size: 48,
              ),
              title: Text(
                AppLocalizations.of(context)!.failedToDeploy(e.toString()),
              ),
              actions: [
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(AppLocalizations.of(context)!.close),
                ),
              ],
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.quickDeploy,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(10),
                Consumer<Deployer>(
                  builder: (ctx, deployer, child) {
                    return deployer.deploying.contains(widget.server.id)
                        ? const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          const Gap(10),
          Expanded(
            child: LayoutBuilder(
              builder: (context, c) {
                final size = MediaQuery.of(context).size;
                late int counts;
                int height = 120;
                if (size.isCompact) {
                  counts = 2;
                } else if (size.isMedium) {
                  counts = 3;
                } else if (size.isExpanded) {
                  counts = 4;
                } else {
                  counts = 5;
                  height = 150;
                }
                final cardWidth =
                    (c.maxWidth - 32 - 10 * (counts - 1)) / counts;
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: counts,
                    childAspectRatio: cardWidth / height,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options[index];
                    return Card(
                      child: InkWell(
                        onTap: () => _showDetails(context, option),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                option.getTitle(context),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Gap(8),
                              Expanded(
                                child: Text(
                                  option.getSummary(context),
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuickDeployOptionDetial extends StatelessWidget {
  const QuickDeployOptionDetial({
    super.key,
    required this.option,
    required this.destination,
  });
  final QuickDeployOption option;
  final String destination;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              option.getTitle(context),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const Gap(16),
        Text(
          option.getDetails(context),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(16),
        option.getFormWidget(context, destination: destination),
        const Gap(10),
        StatefulBuilder(
          builder: (ctx, setState) {
            return SwitchListTile(
              title: Text(AppLocalizations.of(context)!.disableOSFirewall),
              subtitle: Text(
                AppLocalizations.of(context)!.disableOSFirewallDesc,
              ),
              value: option.disableOSFirewall,
              onChanged: (value) {
                setState(() {
                  option.setDisableOSFirewall(value);
                });
              },
            );
          },
        ),
      ],
    );
  }
}

class _UnsavedChangesBar extends StatelessWidget {
  const _UnsavedChangesBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VXBloc, VXState>(
      builder: (context, state) {
        final showBar = state is VXInstalledState && state.configUnsaved;

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          bottom: showBar ? 16 : -100,
          left: 0,
          right: 0,
          child: Center(
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.unappliedChanges,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Gap(16),
                    TextButton(
                      onPressed: () {
                        context.read<VXBloc>().add(VXDiscardChangesEvent());
                      },
                      child: Text(AppLocalizations.of(context)!.discard),
                    ),
                    const Gap(8),
                    if (state is VXInstalledState && state.isSavingConfig)
                      smallCircularProgressIndicator
                    else
                      FilledButton.icon(
                        onPressed: () {
                          context.read<VXBloc>().add(VXSaveConfigEvent());
                        },
                        icon: const Icon(Icons.save_rounded, size: 18),
                        label: Text(AppLocalizations.of(context)!.save),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
