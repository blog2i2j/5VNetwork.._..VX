// Copyright (C) 2026 5V Network LLC <5vnetwork@proton.me>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

import 'dart:convert';

/// Parses the subscription text field into a map for gRPC [share_link_query_extra].
/// Supports JSON objects (`{"tx":"10"}`) and query strings (`tx=10&foo=bar`).
Map<String, String> shareLinkQueryExtraFromStored(String raw) {
  final s = raw.trim();
  if (s.isEmpty) {
    return {};
  }
  if (s.startsWith('{')) {
    try {
      final decoded = jsonDecode(s);
      if (decoded is Map<String, dynamic>) {
        return decoded.map((k, v) => MapEntry(k, '$v'));
      }
    } catch (_) {}
  }
  return Uri.splitQueryString(
    s.startsWith('?') ? s.substring(1) : s,
    encoding: utf8,
  );
}

/// Whether [raw] is accepted by [shareLinkQueryExtraFromStored] (empty, JSON object, or query string).
bool isValidShareLinkQueryExtra(String raw) {
  final s = raw.trim();
  if (s.isEmpty) {
    return true;
  }
  if (s.startsWith('{')) {
    try {
      final decoded = jsonDecode(s);
      return decoded is Map<String, dynamic>;
    } catch (_) {
      return false;
    }
  }
  try {
    Uri.splitQueryString(
      s.startsWith('?') ? s.substring(1) : s,
      encoding: utf8,
    );
    return true;
  } catch (_) {
    return false;
  }
}
