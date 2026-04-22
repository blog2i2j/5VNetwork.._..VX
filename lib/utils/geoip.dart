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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:vector_graphics/vector_graphics_compat.dart';
import 'package:flutter_common/util/net.dart';
import 'package:vx/utils/logger.dart';

Future<String?> getCountryCode(String address, [http.Client? client]) async {
  final httpClient = client ?? http.Client();
  try {
    String ip = address;
    if (isDomain(address)) {
      final addresses = await InternetAddress.lookup(address);
      if (addresses.isNotEmpty) {
        ip = addresses.first.address;
      }
    }
    // https://free.freeipapi.com/api/json/{ip}
    final url = Uri.parse('https://free.freeipapi.com/api/json/$ip');
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final countryCode = jsonData['countryCode'] as String?;
      return countryCode;
    } else {
      logger.d('getCountryCode: HTTP ${response.statusCode}');
      return null;
    }
  } catch (e) {
    logger.d('getCountryCode error', error: e);
    return null;
  } finally {
    if (client == null) {
      httpClient.close();
    }
  }
}

Widget getCountryIcon(String countryCode, {double size = 24}) {
  if (countryCode.isEmpty) {
    return Icon(Icons.language);
  }
  return SvgPicture(
    height: size,
    width: size,
    AssetBytesLoader('assets/icons/flags/${countryCode.toLowerCase()}.svg.vec'),
  );
}
