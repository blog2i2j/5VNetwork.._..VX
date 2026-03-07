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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm/protos/protos/tun.pb.dart';
import 'package:vx/app/settings/advanced/system_proxy.dart';
import 'package:vx/app/x_controller.dart';
import 'package:vx/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vx/app/settings/advanced/proxy_share.dart';
import 'package:vx/pref_helper.dart';

class AdvancedScreen extends StatelessWidget {
  const AdvancedScreen({super.key, this.showAppBar = true});
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(AppLocalizations.of(context)!.advanced),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(AppLocalizations.of(context)!.proxyShare,
                  style: Theme.of(context).textTheme.bodyLarge),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) {
                  return ProxyShareSettingScreen(
                    fullscreen: showAppBar,
                  );
                }));
              },
            ),
            const Divider(),
            const SniffSetting(),
            const Divider(),
            const FallbackSetting(),
            const Divider(),
            const Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
              child: TunSetting(),
            ),
            const Divider(),
            const SystemProxySetting(),
            const Divider(),
            const RejectQuicHysteriaSetting(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class SniffSetting extends StatefulWidget {
  const SniffSetting({super.key});

  @override
  State<SniffSetting> createState() => _SniffSettingState();
}

class _SniffSettingState extends State<SniffSetting> {
  bool _sniffing = false;

  @override
  void initState() {
    super.initState();
    _sniffing = context.read<SharedPreferences>().sniff;
  }

  void _toggleSniffing(bool value) {
    context.read<SharedPreferences>().setSniff(value);
    setState(() {
      _sniffing = value;
    });
    context.read<XController>().restart();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.sniff,
                  style: Theme.of(context).textTheme.bodyLarge),
              Switch(
                value: _sniffing,
                onChanged: _toggleSniffing,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FallbackSetting extends StatefulWidget {
  const FallbackSetting({super.key});

  @override
  State<FallbackSetting> createState() => _FallbackSettingState();
}

class _FallbackSettingState extends State<FallbackSetting> {
  bool _fallbackToProxy = false;
  bool _fallbackRetryDomain = false;
  bool _changeIpv6ToDomain = false;

  @override
  void initState() {
    super.initState();
    final pref = context.read<SharedPreferences>();
    _fallbackToProxy = pref.fallbackToProxy;
    _fallbackRetryDomain = pref.fallbackRetryDomain;
    _changeIpv6ToDomain = pref.changeIpv6ToDomain;
  }

  void _toggleFallbackToProxy(bool value) {
    context.read<SharedPreferences>().setFallbackToProxy(value);
    setState(() {
      _fallbackToProxy = value;
    });
    context.read<XController>().restart();
  }

  void _toggleFallbackRetryDomain(bool value) {
    context.read<SharedPreferences>().setFallbackRetryDomain(value);
    setState(() {
      _fallbackRetryDomain = value;
    });
    context.read<XController>().restart();
  }

  void _toggleChangeIpv6ToDomain(bool value) {
    context.read<SharedPreferences>().setChangeIpv6ToDomain(value);
    setState(() {
      _changeIpv6ToDomain = value;
    });
    context.read<XController>().restart();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.fallbackToProxy,
                  style: Theme.of(context).textTheme.bodyLarge),
              Switch(
                value: _fallbackToProxy,
                onChanged: _toggleFallbackToProxy,
              ),
            ],
          ),
          const Gap(5),
          Text(AppLocalizations.of(context)!.fallbackToProxySetting,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.fallbackRetryDomain,
                  style: Theme.of(context).textTheme.bodyLarge),
              Switch(
                value: _fallbackRetryDomain,
                onChanged: _toggleFallbackRetryDomain,
              ),
            ],
          ),
          const Gap(5),
          Text(AppLocalizations.of(context)!.fallbackRetryDomainDesc,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.changeIpv6ToDomain,
                  style: Theme.of(context).textTheme.bodyLarge),
              Switch(
                value: _changeIpv6ToDomain,
                onChanged: _toggleChangeIpv6ToDomain,
              ),
            ],
          ),
          const Gap(5),
          Text(AppLocalizations.of(context)!.changeIpv6ToDomainDesc,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
        ],
      ),
    );
  }
}

/// Widget for TUN-related settings: tun IPv4/IPv6 (tun46Setting),
/// reject IPv6, and reject QUIC (all map to [TunConfig] fields).
class TunSetting extends StatefulWidget {
  const TunSetting({super.key});

  @override
  State<TunSetting> createState() => _TunSettingState();
}

class _TunSettingState extends State<TunSetting> {
  bool _rejectIpv6 = false;
  bool _rejectQuic = false;
  late final TextEditingController _cidr4Controller;
  late final TextEditingController _cidr6Controller;
  late final TextEditingController _dns4Controller;
  late final TextEditingController _dns6Controller;
  late final TextEditingController _mtuController;

  @override
  void initState() {
    super.initState();
    final pref = context.read<SharedPreferences>();
    _rejectIpv6 = pref.rejectIpv6;
    _rejectQuic = pref.rejectQuic;
    _cidr4Controller = TextEditingController(text: pref.tunCidr4 ?? '');
    _cidr6Controller = TextEditingController(text: pref.tunCidr6 ?? '');
    _dns4Controller = TextEditingController(text: pref.tunDns4 ?? '');
    _dns6Controller = TextEditingController(text: pref.tunDns6 ?? '');
    _mtuController = TextEditingController(
        text: pref.tunMtu != null ? '${pref.tunMtu}' : '');
  }

  @override
  void dispose() {
    _cidr4Controller.dispose();
    _cidr6Controller.dispose();
    _dns4Controller.dispose();
    _dns6Controller.dispose();
    _mtuController.dispose();
    super.dispose();
  }

  void _saveCidr4(String value) {
    context.read<SharedPreferences>().setTunCidr4(value.isEmpty ? null : value);
    context.read<XController>().restart();
  }

  void _saveCidr6(String value) {
    context.read<SharedPreferences>().setTunCidr6(value.isEmpty ? null : value);
    context.read<XController>().restart();
  }

  void _saveDns4(String value) {
    context.read<SharedPreferences>().setTunDns4(value.isEmpty ? null : value);
    context.read<XController>().restart();
  }

  void _saveDns6(String value) {
    context.read<SharedPreferences>().setTunDns6(value.isEmpty ? null : value);
    context.read<XController>().restart();
  }

  void _saveMtu(String value) {
    final v = value.trim();
    final parsed = v.isEmpty ? null : int.tryParse(v);
    context
        .read<SharedPreferences>()
        .setTunMtu(parsed != null && parsed > 0 ? parsed : null);
    context.read<XController>().restart();
  }

  void _toggleRejectIpv6(bool value) {
    context.read<SharedPreferences>().setRejectIpv6(value);
    setState(() => _rejectIpv6 = value);
    context.read<XController>().restart();
  }

  void _toggleRejectQuic(bool value) {
    context.read<SharedPreferences>().setRejectQuic(value);
    setState(() => _rejectQuic = value);
    context.read<XController>().restart();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TunIpv6Settings(),
        const Gap(16),
        TextField(
          controller: _cidr4Controller,
          decoration: InputDecoration(
            labelText: l10n.tunCidr4,
            hintText: l10n.tunCidr4Hint,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          textInputAction: TextInputAction.next,
          onSubmitted: _saveCidr4,
          onEditingComplete: () => _saveCidr4(_cidr4Controller.text),
        ),
        const Gap(10),
        TextField(
          controller: _cidr6Controller,
          decoration: InputDecoration(
            labelText: l10n.tunCidr6,
            hintText: l10n.tunCidr6Hint,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          textInputAction: TextInputAction.next,
          onSubmitted: _saveCidr6,
          onEditingComplete: () => _saveCidr6(_cidr6Controller.text),
        ),
        const Gap(10),
        TextField(
          controller: _dns4Controller,
          decoration: InputDecoration(
            labelText: l10n.tunDns4,
            hintText: l10n.tunDns4Hint,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          textInputAction: TextInputAction.next,
          onSubmitted: _saveDns4,
          onEditingComplete: () => _saveDns4(_dns4Controller.text),
        ),
        const Gap(10),
        TextField(
          controller: _dns6Controller,
          decoration: InputDecoration(
            labelText: l10n.tunDns6,
            hintText: l10n.tunDns6Hint,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          textInputAction: TextInputAction.next,
          onSubmitted: _saveDns6,
          onEditingComplete: () => _saveDns6(_dns6Controller.text),
        ),
        const Gap(10),
        TextField(
          controller: _mtuController,
          decoration: InputDecoration(
            labelText: l10n.tunMtu,
            hintText: l10n.tunMtuHint,
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          onSubmitted: _saveMtu,
          onEditingComplete: () => _saveMtu(_mtuController.text),
        ),
        const Gap(16),
        SwitchListTile(
          title: Text(l10n.tunRejectIpv6,
              style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text(l10n.tunRejectIpv6Desc,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
          value: _rejectIpv6,
          onChanged: _toggleRejectIpv6,
        ),
        SwitchListTile(
          title: Text(l10n.tunRejectQuic,
              style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text(l10n.tunRejectQuicDesc,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  )),
          value: _rejectQuic,
          onChanged: _toggleRejectQuic,
        ),
      ],
    );
  }
}

class TunIpv6Settings extends StatefulWidget {
  const TunIpv6Settings({super.key});

  @override
  State<TunIpv6Settings> createState() => _TunIpv6SettingsState();
}

class _TunIpv6SettingsState extends State<TunIpv6Settings> {
  TunConfig_TUN46Setting _tun46Setting = TunConfig_TUN46Setting.DYNAMIC;

  @override
  void initState() {
    super.initState();
    _tun46Setting = context.read<SharedPreferences>().tun46Setting;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.tunIpv6Settings,
            style: Theme.of(context).textTheme.bodyLarge),
        const Gap(10),
        DropdownMenu<TunConfig_TUN46Setting>(
            initialSelection: _tun46Setting,
            requestFocusOnTap: false,
            dropdownMenuEntries: [
              DropdownMenuEntry(
                  value: TunConfig_TUN46Setting.FOUR_ONLY,
                  label: AppLocalizations.of(context)!.tun46SettingIpv4Only),
              DropdownMenuEntry(
                  value: TunConfig_TUN46Setting.BOTH,
                  label: AppLocalizations.of(context)!.tun46SettingIpv4AndIpv6),
              DropdownMenuEntry(
                  value: TunConfig_TUN46Setting.DYNAMIC,
                  label: AppLocalizations.of(context)!.dependsOnDefaultNic),
            ],
            onSelected: (value) {
              context
                  .read<SharedPreferences>()
                  .setTun46Setting(value ?? TunConfig_TUN46Setting.DYNAMIC);
              setState(() {
                _tun46Setting = value ?? TunConfig_TUN46Setting.DYNAMIC;
              });
              context.read<XController>().restart();
            }),
        const Gap(10),
        if (_tun46Setting == TunConfig_TUN46Setting.DYNAMIC)
          Text(AppLocalizations.of(context)!.dependsOnDefaultNicDesc,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ))
        else if (_tun46Setting == TunConfig_TUN46Setting.FOUR_ONLY)
          Text(AppLocalizations.of(context)!.tunIpv4Desc,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ))
      ],
    );
  }
}

class RejectQuicHysteriaSetting extends StatefulWidget {
  const RejectQuicHysteriaSetting({super.key});

  @override
  State<RejectQuicHysteriaSetting> createState() =>
      _RejectQuicHysteriaSettingState();
}

class _RejectQuicHysteriaSettingState extends State<RejectQuicHysteriaSetting> {
  bool _rejectQuicHysteria = false;

  @override
  void initState() {
    super.initState();
    _rejectQuicHysteria = context.read<SharedPreferences>().rejectQuicHysteria;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.hysteriaRejectQuic,
              style: Theme.of(context).textTheme.bodyLarge),
          const Gap(10),
          Switch(
            value: _rejectQuicHysteria,
            onChanged: (value) {
              context.read<SharedPreferences>().setRejectQuicHysteria(value);
              setState(() {
                _rejectQuicHysteria = value;
              });
              context.read<XController>().restart();
            },
          ),
        ],
      ),
    );
  }
}
