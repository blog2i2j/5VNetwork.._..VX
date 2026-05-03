import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:vx/data/database.dart';
import 'generated/schema.dart';

import 'generated/schema_v5.dart' as v5;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('test', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final schema = await verifier.schemaAt(5);
    // Run the migration and verify that it adds the name column.
    final db = v5.DatabaseAtV5(schema.newConnection());

    const statement =
        'INSERT INTO "subscriptions" ("name", "link", "website", "description", "last_update", "last_success_update") VALUES (?, ?, ?, ?, ?, ?)';
    final args = [1, 'https://1', 'https://1', 'https://1', 0, 0];
    await db.customInsert(
      statement,
      variables: args.map((e) => Variable<Object>(e)).toList(),
    );
    // veriffy
    final data = await db.select(db.subscriptions).get();
    expect(data, isNotEmpty);
    expect(data.first.name, '1');
    expect(data.first.link, 'https://1');
    expect(data.first.website, 'https://1');
    expect(data.first.description, 'https://1');
  });

  test('generate clean.db', () async {
    const outputPath = 'assets/clean.db'; // will be created in project root
    final file = File(outputPath);
    if (await file.exists()) {
      await file.delete();
    }

    // Use your real Drift DB + migrations
    final db = AppDatabase(path: outputPath, executor: NativeDatabase(file));

    // Force open so migrations run
    await db.customSelect('SELECT 1').get();

    await db.close();
    print('Clean DB generated at $outputPath');
  });
}
