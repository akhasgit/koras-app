import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

/// Interview Prep resume state — mirrors the web localStorage shape. See 07/15.
class PracticeSessions extends Table {
  TextColumn get scenarioId => text()();
  TextColumn get practiceSessionId => text()();
  TextColumn get stateJson => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {scenarioId};
}

/// Optional last-viewed report cache (glance-while-loading). Cleared on sign-out.
class CachedReports extends Table {
  TextColumn get key => text()();
  TextColumn get json => text()();
  DateTimeColumn get cachedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [PracticeSessions, CachedReports])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _open());

  @override
  int get schemaVersion => 1;

  /// Clear all local caches (call on sign-out so accounts never share data).
  Future<void> clearAll() async {
    await batch((b) {
      b.deleteAll(practiceSessions);
      b.deleteAll(cachedReports);
    });
  }

  static QueryExecutor _open() {
    return LazyDatabase(() async {
      final dir = await getApplicationSupportDirectory();
      final file = p.join(dir.path, 'koras.sqlite');
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      return NativeDatabase.createInBackground(File(file));
    });
  }
}
