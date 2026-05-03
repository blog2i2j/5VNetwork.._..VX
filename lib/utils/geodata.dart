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

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vx/app/routing/repo.dart';
import 'package:vx/utils/logger.dart';
import 'package:vx/common/const.dart';
import 'package:vx/pref_helper.dart';
import 'package:vx/utils/download.dart';
import 'package:vx/utils/path.dart';
import 'package:vx/utils/xapi_client.dart';

Future<void> writeStaticGeo() async {
  logger.d('writeStaticGeo');
  final geoFile = await rootBundle.load('assets/geo/simplified_geosite.dat');
  final geoIP = await rootBundle.load('assets/geo/simplified_geoip.dat');
  // write to file
  File(
    await getSimplifiedGeositePath(),
  ).writeAsBytesSync(geoFile.buffer.asUint8List());
  File(
    await getSimplifiedGeoIPPath(),
  ).writeAsBytesSync(geoIP.buffer.asUint8List());
}

class GeoDataHelper {
  final Downloader downloader;
  final SharedPreferences pref;
  final XApiClient xApiClient;
  final DbHelper databaseHelper;
  final String resouceDirPath;
  final String geoSiteUrl;
  final String geoIpUrl;

  GeoDataHelper({
    required this.downloader,
    required this.pref,
    required this.xApiClient,
    required this.databaseHelper,
    required this.resouceDirPath,
    required this.geoSiteUrl,
    required this.geoIpUrl,
  });

  Completer<void>? _completer;
  Timer? _updateTimer;

  /// download geosite and geoip and update the last geo update time
  Future<void> downloadAndProcessGeo() async {
    if (_completer != null) {
      return _completer!.future;
    }
    _completer = Completer<void>();

    logger.d('downloadGeo');
    try {
      final tasks = [
        downloader.downloadProxyFirst(geoSiteUrl, await getGeositePath()),
        downloader.downloadProxyFirst(geoIpUrl, await getGeoIPPath()),
      ];
      await Future.wait(tasks);
      await xApiClient.processGeoFiles();
      _completer!.complete();
    } catch (e) {
      logger.e('downloadAndProcessGeo error', error: e);
      // await reportError(e, StackTrace.current);
      _completer!.completeError(e);
    } finally {
      _completer = null;
    }
  }

  Future<void> makeGeoDataAvailable({bool update = false}) async {
    try {
      logger.d('makeGeoDataAvailable');
      // check if there is geo data
      final dir = Directory(resouceDirPath);
      final geoSiteFile = File(join(dir.path, 'geoip.dat'));
      final geoIpFile = File(join(dir.path, 'geosite.dat'));
      if (!geoSiteFile.existsSync() || !geoIpFile.existsSync() || update) {
        await downloadAndProcessGeo();
      }
      // download all clash rule files and clean files that are not in the urls
      final clashUrls = <String>{};
      final geoUrls = <String>{};
      await databaseHelper.getAtomicDomainSets().then((values) async {
        for (final set in values) {
          clashUrls.addAll(set.clashRuleUrls ?? []);
          if (set.geoUrl != null && set.geoUrl!.isNotEmpty) {
            geoUrls.add(set.geoUrl!);
          }
        }
      });
      await databaseHelper.getAppSets().then((values) async {
        for (final set in values) {
          clashUrls.addAll(set.clashRuleUrls ?? []);
        }
      });
      await databaseHelper.getAtomicIpSets().then((values) async {
        for (final set in values) {
          clashUrls.addAll(set.clashRuleUrls ?? []);
          if (set.geoUrl != null && set.geoUrl!.isNotEmpty) {
            geoUrls.add(set.geoUrl!);
          }
        }
      });
      final futures = <Future>[];
      for (final url in clashUrls) {
        final path = await getClashRulesPath(url);
        if (!File(path).existsSync() || update) {
          futures.add(downloader.download(url, path));
        }
      }
      for (final url in geoUrls) {
        final path = await getGeoUrlPath(url);
        if (!File(path).existsSync() || update) {
          futures.add(downloader.download(url, path));
        }
      }
      await Future.wait(futures);
      // clean files that are not in the urls
      final paths = <String>{};
      for (final url in clashUrls) {
        paths.add(await getClashRulesPath(url));
      }
      for (final url in geoUrls) {
        paths.add(await getGeoUrlPath(url));
      }
      for (final file in (await getClashRulesDir()).listSync()) {
        if (!paths.contains(file.path)) {
          file.deleteSync();
        }
      }
      for (final file in (await getGeoDir()).listSync()) {
        if (!paths.contains(file.path)) {
          file.deleteSync();
        }
      }
      pref.setLastGeoUpdate(DateTime.now());
    } catch (e) {
      logger.e('makeGeoDataAvailable error', error: e);
      // await reportError(e, StackTrace.current);
    }
  }

  /// Start auto-update for geo files based on user preferences
  /// Updates occur at the configured interval based on last update time
  void reset() {
    // Cancel any existing timer
    _updateTimer?.cancel();
    _updateTimer = null;

    // Check if auto-update is enabled
    if (!pref.autoUpdateGeoFiles) {
      logger.d('Geo file auto-update is disabled');
      return;
    }

    final now = DateTime.now();
    final updateIntervalDays = pref.geoUpdateInterval;
    final lastUpdate = pref.lastGeoUpdate;

    DateTime nextUpdate;

    if (lastUpdate == null) {
      // No previous update - update immediately
      logger.d('No previous geo file update, updating immediately');
      makeGeoDataAvailable(update: true);

      // Schedule next update from now
      nextUpdate = now.add(Duration(days: updateIntervalDays));
    } else {
      // Calculate next update based on last update time + interval
      nextUpdate = lastUpdate.add(Duration(days: updateIntervalDays));

      // If next update time has passed, update immediately
      if (nextUpdate.isBefore(now) || nextUpdate.isAtSameMomentAs(now)) {
        logger.d('Geo file update is overdue, updating immediately');
        makeGeoDataAvailable(update: true);

        // Schedule next update from now
        nextUpdate = now.add(Duration(days: updateIntervalDays));
      }
    }

    // Schedule the timer for the next update
    final delay = nextUpdate.difference(now);
    _updateTimer = Timer(delay, () {
      makeGeoDataAvailable(update: true);

      // After first update, schedule periodic updates at the configured interval
      _updateTimer = Timer.periodic(Duration(days: updateIntervalDays), (_) {
        makeGeoDataAvailable(update: true);
      });
    });

    logger.d(
      'Geo file auto-update scheduled: interval=$updateIntervalDays days, next update at ${nextUpdate.toIso8601String()} (in ${delay.inHours}h ${delay.inMinutes % 60}m)',
    );
  }
}
