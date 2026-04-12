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

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vx/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vx/app/layout_provider.dart';

mixin FormDataGetter {
  Object? get formData;
}

Future<T> showMyAdaptiveDialog<T>(
  BuildContext context,
  Widget widget, {
  String? title,
  Function(BuildContext)? onSave,
  String? saveText,
  bool editable = true,
}) async {
  late Object? result;
  if (Provider.of<MyLayout>(context, listen: false).fullScreen()) {
    result = await Navigator.of(context, rootNavigator: true).push(
      CupertinoPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: !Platform.isMacOS && title != null ? Text(title) : null,
            automaticallyImplyLeading: false,
            leading: !Platform.isMacOS
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => ctx.pop(),
                  )
                : null,
            actions: [
              if (Platform.isMacOS)
                TextButton(
                  onPressed: () => ctx.pop(),
                  child: Text(AppLocalizations.of(ctx)!.cancel),
                ),
              if (editable)
                TextButton(
                  onPressed: () => onSave?.call(ctx),
                  child: Text(saveText ?? AppLocalizations.of(ctx)!.save),
                ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(child: widget),
            ),
          ),
        ),
      ),
    );
  } else {
    result = await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: AppLocalizations.of(context)!.edit,
      pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
        scrollable: true,
        title: title != null ? Text(title) : null,
        actions: [
          FilledButton.tonal(
            style: FilledButton.styleFrom(
              fixedSize: const Size(100, 40),
              elevation: 1,
            ),
            onPressed: () => context.pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          const SizedBox(width: 10),
          if (editable)
            Builder(
              builder: (context) {
                return FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(100, 40),
                    elevation: 1,
                  ),
                  onPressed: () => onSave?.call(context),
                  child: Text(saveText ?? AppLocalizations.of(context)!.save),
                );
              },
            ),
        ],
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: widget,
          ),
        ),
      ),
    );
  }
  return result as T;
}

Future<String?> showStringForm(
  BuildContext context, {
  String? initialValue,
  String? title,
  String? helperText,
  String? labelText,
  bool obscureText = false,
  int maxLines = 1,
  String? cancelText,
}) async {
  return await showDialog<String?>(
    context: context,
    builder: (context) => StringForm(
      initialValue: initialValue,
      title: title,
      helperText: helperText,
      maxLines: maxLines,
      labelText: labelText,
      obscureText: obscureText,
      cancelText: cancelText,
    ),
  );
}

class StringForm extends StatefulWidget {
  const StringForm({
    super.key,
    this.initialValue,
    this.title,
    this.helperText,
    this.maxLines = 1,
    this.labelText,
    this.obscureText = false,
    this.cancelText,
  });
  final String? initialValue;
  final String? title;
  final String? helperText;
  final int maxLines;
  final String? labelText;
  final bool obscureText;
  final String? cancelText;
  @override
  State<StringForm> createState() => _StringFormState();
}

class _StringFormState extends State<StringForm> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _nameController.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null ? Text(widget.title!) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _nameController,
            maxLines: widget.maxLines,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              helperText: widget.helperText,
              labelText: widget.labelText,
              helperStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            widget.cancelText ?? AppLocalizations.of(context)!.cancel,
          ),
        ),
        TextButton(
          onPressed: () {
            if (_nameController.text.isNotEmpty) {
              Navigator.pop(context, _nameController.text);
            }
          },
          child: Text(AppLocalizations.of(context)!.confirm),
        ),
      ],
    );
  }
}
