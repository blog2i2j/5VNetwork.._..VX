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

part of 'vx_config.dart';

class _Inbounds extends StatelessWidget {
  const _Inbounds({required this.config});
  final ServerConfig config;

  Future<void> _onAddMulti(BuildContext context) async {
    final k = GlobalKey();
    final bloc = context.read<VXBloc>();
    final config = await showMyAdaptiveDialog<MultiProxyInboundConfig?>(
      context,
      MultiInboundForm(key: k, multiConfig: MultiProxyInboundConfig()),
      title: AppLocalizations.of(context)!.addMulti,
      onSave: (BuildContext context) {
        final formData = (k.currentState as FormDataGetter).formData;
        if (formData != null) {
          final inbound = formData as MultiProxyInboundConfig;
          final currentConfig = switch (bloc.state) {
            VXInstalledState(:final config) => config,
            _ => null,
          };
          if (currentConfig != null) {
            if (currentConfig.multiInbounds.any((e) => e.tag == inbound.tag)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.duplicateInboundTagName,
                  ),
                ),
              );
            } else {
              Navigator.of(context).pop(formData);
            }
          }
        }
      },
    );
    if (config != null) {
      bloc.add(VXAddMultiInboundEvent(config));
    }
  }

  Future<void> _onAddSingle(BuildContext context) async {
    final bloc = context.read<VXBloc>();
    final k = GlobalKey();
    final config = await showMyAdaptiveDialog<ProxyInboundConfig?>(
      context,
      InboundForm(key: k, config: ProxyInboundConfig()),
      title: AppLocalizations.of(context)!.addSingle,
      onSave: (BuildContext context) {
        final formData = (k.currentState as FormDataGetter).formData;
        if (formData != null) {
          final inbound = formData as ProxyInboundConfig;
          final currentConfig = switch (bloc.state) {
            VXInstalledState(:final config) => config,
            _ => null,
          };
          if (currentConfig != null) {
            if (currentConfig.inbounds.any((e) => e.tag == inbound.tag)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.duplicateInboundTagName,
                  ),
                ),
              );
            } else {
              Navigator.of(context).pop(formData);
            }
          }
        }
      },
    );
    if (config != null) {
      bloc.add(VXAddInboundEvent(config));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuAnchor(
          menuChildren: [
            MenuItemButton(
              onPressed: () => _onAddMulti(context),
              child: Text(AppLocalizations.of(context)!.addMulti),
            ),
            MenuItemButton(
              onPressed: () => _onAddSingle(context),
              child: Text(AppLocalizations.of(context)!.addSingle),
            ),
          ],
          builder: (context, controller, child) {
            return FilledButton.tonalIcon(
              onPressed: () => controller.open(),
              icon: const Icon(Icons.add),
              label: Text(AppLocalizations.of(context)!.add),
            );
          },
        ),
        const Gap(10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: LayoutBuilder(
              builder: (ctx, c) {
                const cardHeight = 136;
                final count = c.maxWidth ~/ 250;
                final cardWidth = (c.maxWidth - ((count - 1) * 10)) / count;
                return CustomScrollView(
                  slivers: [
                    SliverGrid.list(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: cardWidth / cardHeight,
                      ),
                      children: [
                        ...config.inbounds.indexed.map(
                          (e) => InboundCard(config: e.$2, index: e.$1),
                        ),
                        ...config.multiInbounds.indexed.map(
                          (e) => InboundCard(multiConfig: e.$2, index: e.$1),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class InboundCard extends StatelessWidget {
  const InboundCard({
    super.key,
    required this.index,
    this.config,
    this.multiConfig,
  });
  final int index;
  // either one should be non-null
  final ProxyInboundConfig? config;
  final MultiProxyInboundConfig? multiConfig;

  String get name => config?.tag ?? multiConfig!.tag;

  Future<void> _onEditMulti(BuildContext context) async {
    final k = GlobalKey();
    final bloc = context.read<VXBloc>();

    final newConfig = await showMyAdaptiveDialog<MultiProxyInboundConfig?>(
      context,
      MultiInboundForm(key: k, multiConfig: multiConfig!),
      title: AppLocalizations.of(context)!.edit,
      onSave: (BuildContext context) {
        final formData = (k.currentState as FormDataGetter).formData;
        if (formData != null) {
          final inbound = formData as MultiProxyInboundConfig;
          Navigator.of(context).pop(inbound);
        }
      },
    );
    if (newConfig != null) {
      bloc.add(VXEditMultiInboundEvent(index, newConfig));
    }
  }

  Future<void> _onEditSingle(BuildContext context) async {
    final bloc = context.read<VXBloc>();
    final k = GlobalKey();
    final newConfig = await showMyAdaptiveDialog<ProxyInboundConfig?>(
      context,
      InboundForm(key: k, config: config!),
      title: AppLocalizations.of(context)!.edit,
      onSave: (BuildContext context) {
        final formData = (k.currentState as FormDataGetter).formData;
        if (formData != null) {
          final inbound = formData as ProxyInboundConfig;
          Navigator.of(context).pop(inbound);
        }
      },
    );
    if (newConfig != null) {
      bloc.add(VXEditInboundEvent(index, newConfig));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: () =>
          config != null ? _onEditSingle(context) : _onEditMulti(context),
      menuChildren: [
        MenuItemButton(
          onPressed: () => context.read<VXBloc>().add(
            VXAddToNodesEvent(inbound: config, multiInbound: multiConfig),
          ),
          child: Text(AppLocalizations.of(context)!.addToNodes),
        ),
        const Divider(),
        MenuItemButton(
          onPressed: () => context.read<VXBloc>().add(
            config != null
                ? VXRemoveInboundEvent(config!.tag)
                : VXRemoveMultiInboundEvent(multiConfig!.tag),
          ),
          child: Text(AppLocalizations.of(context)!.delete),
        ),
      ],
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              Text(
                address,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              Text(
                proxyProtocol,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              Text(
                transportProtocol,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              Text(
                securityProtocol,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get securityProtocol {
    if (config != null) {
      if (config!.transport.hasTls()) {
        return 'TLS';
      } else if (config!.transport.hasReality()) {
        return 'Reality';
      }
      return '';
    }
    List<String> ret = [];
    for (var e in multiConfig!.securityConfigs) {
      if (e.hasTls()) {
        ret.add('TLS');
      } else if (e.hasReality()) {
        ret.add('Reality');
      }
    }
    return ret.join(',');
  }

  String get proxyProtocol {
    List<Any> protocols = [];
    if (config != null) {
      if (config!.hasProtocol()) {
        protocols.add(config!.protocol);
      } else {
        protocols.addAll(config!.protocols);
      }
    } else {
      protocols = multiConfig!.protocols;
    }
    return protocols.map((e) => getProtocolTypeFromAny(e).label).join(',');
  }

  String get transportProtocol {
    if (config != null) {
      if (config!.hasTransport()) {
        final transportProtocol = config!.transport.getProtocol();
        if (transportProtocol != null) {
          return transportProtocol;
        }
      }
      return 'RAW';
    }
    List<String> ret = [];
    for (var e in multiConfig!.transportProtocols) {
      if (e.hasWebsocket()) {
        ret.add('WS');
      } else if (e.hasGrpc()) {
        ret.add('GRPC');
      } else if (e.hasHttp()) {
        ret.add('HTTP');
      } else if (e.hasHttpupgrade()) {
        ret.add('HTTPUPGRADE');
      } else if (e.hasSplithttp()) {
        ret.add('XHTTP');
      }
    }
    return ret.join(',');
  }

  String get address {
    if (config != null) {
      late String port;
      if (config!.port != 0) {
        port = config!.port.toString();
      } else {
        port = config!.ports.join(',');
      }
      String address = config!.address;
      if (address.isEmpty) {
        address = '0.0.0.0';
      }
      return '$address: $port';
    }
    final ports = multiConfig!.ports.join(',');
    String address = multiConfig!.address;
    if (address.isEmpty) {
      address = '0.0.0.0';
    }
    return '$address: $ports';
  }
}
