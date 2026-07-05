import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/local/app_database.dart';
import 'interview_models.dart';

part 'practice_session_dao.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@riverpod
PracticeSessionStore practiceSessionStore(Ref ref) =>
    PracticeSessionStore(ref.watch(appDatabaseProvider));

/// Stores `InterviewPracticeSessionState` as JSON, keyed by scenario — mirrors
/// the web `localStorage` key `interview_practice_session_<scenarioId>`. See 15.
class PracticeSessionStore {
  PracticeSessionStore(this._db);
  final AppDatabase _db;

  Future<InterviewPracticeSessionState?> load(String scenarioId) async {
    final row = await (_db.select(_db.practiceSessions)
          ..where((t) => t.scenarioId.equals(scenarioId)))
        .getSingleOrNull();
    if (row == null) return null;
    return InterviewPracticeSessionState.fromJson(
        jsonDecode(row.stateJson) as Map<String, dynamic>);
  }

  Future<void> save(InterviewPracticeSessionState s) =>
      _db.into(_db.practiceSessions).insertOnConflictUpdate(
            PracticeSessionsCompanion.insert(
              scenarioId: s.scenarioId,
              practiceSessionId: s.practiceSessionId,
              stateJson: jsonEncode(s.toJson()),
              updatedAt: DateTime.now().toUtc(),
            ),
          );

  Future<void> clear(String scenarioId) => (_db.delete(_db.practiceSessions)
        ..where((t) => t.scenarioId.equals(scenarioId)))
      .go();
}
