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

part of 'main.dart';

Future<AppDatabase?> _initDatabase(
  SharedPreferences pref, {
  QueryInterceptor? interceptor,
}) async {
  try {
    final path = await getDbPath(pref);
    final db = AppDatabase(path: path, interceptor: interceptor);
    await db.customSelect('SELECT 1').get();
    // if (Platform.isAndroid) {
    //   // PRAGMA quick_check returns one row "ok" if healthy,
    //   // or multiple rows describing each corruption found.
    //   final rows = await db.customSelect('PRAGMA quick_check').get();
    //   final messages = rows
    //       .map((r) => r.data.values.first?.toString() ?? '')
    //       .toList();
    //   logger.d('quick_check messages: $messages');
    //   if (messages.length != 1 || messages.first != 'ok') {
    //     final report = messages.join('\n');
    //     logger.e('Database corruption detected:\n$report');
    //     reportError("database corruption detected", report);
    //     fatalErrorMessage =
    //         "Database was corrupted. Details of corruption: $report";
    //   }
    // }

    return db;
  } catch (e) {
    logger.e('Error initializing database', error: e);
    reportError("init database", e);

    if (e.toString().contains('malformed') ||
        e.toString().contains('corrupt') ||
        e.toString().contains('SqliteException(11)')) {
      try {
        final path = await getDbPath(pref);
        // Try to get a detailed corruption report before deleting.
        String report = '';
        try {
          final corruptDb = AppDatabase(path: path, interceptor: interceptor);
          final rows = await corruptDb
              .customSelect('PRAGMA integrity_check')
              .get();
          report = rows
              .map((r) => r.data.values.first?.toString() ?? '')
              .join('\n');
          logger.e('Integrity check on corrupt database:\n$report');
          reportError("integrity_check before recovery", report);
          await corruptDb.close();
        } catch (_) {}

        logger.w('Attempting database recovery by deleting corrupt file');
        await _deleteCorruptDatabase(path);
        final db = AppDatabase(path: path, interceptor: interceptor);
        fatalErrorMessage =
            "Database was corrupted and has been recreated. Your data has been reset.\n$report";
        return db;
      } catch (e2) {
        logger.e('Error recovering database', error: e2);
        reportError("recover database", e2);
      }
    }

    fatalErrorMessage = "Failed to initialize database: $e";
  }

  return null;
}

Future<void> _deleteCorruptDatabase(String path) async {
  final files = [
    File(path),
    File('$path-wal'),
    File('$path-shm'),
    File('$path-journal'),
  ];
  for (final f in files) {
    if (await f.exists()) {
      logger.w('Deleting corrupt database file: ${f.path}');
      await f.delete();
    }
  }
}
