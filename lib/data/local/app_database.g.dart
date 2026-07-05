// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PracticeSessionsTable extends PracticeSessions
    with TableInfo<$PracticeSessionsTable, PracticeSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PracticeSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _scenarioIdMeta =
      const VerificationMeta('scenarioId');
  @override
  late final GeneratedColumn<String> scenarioId = GeneratedColumn<String>(
      'scenario_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _practiceSessionIdMeta =
      const VerificationMeta('practiceSessionId');
  @override
  late final GeneratedColumn<String> practiceSessionId =
      GeneratedColumn<String>('practice_session_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateJsonMeta =
      const VerificationMeta('stateJson');
  @override
  late final GeneratedColumn<String> stateJson = GeneratedColumn<String>(
      'state_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [scenarioId, practiceSessionId, stateJson, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'practice_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<PracticeSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('scenario_id')) {
      context.handle(
          _scenarioIdMeta,
          scenarioId.isAcceptableOrUnknown(
              data['scenario_id']!, _scenarioIdMeta));
    } else if (isInserting) {
      context.missing(_scenarioIdMeta);
    }
    if (data.containsKey('practice_session_id')) {
      context.handle(
          _practiceSessionIdMeta,
          practiceSessionId.isAcceptableOrUnknown(
              data['practice_session_id']!, _practiceSessionIdMeta));
    } else if (isInserting) {
      context.missing(_practiceSessionIdMeta);
    }
    if (data.containsKey('state_json')) {
      context.handle(_stateJsonMeta,
          stateJson.isAcceptableOrUnknown(data['state_json']!, _stateJsonMeta));
    } else if (isInserting) {
      context.missing(_stateJsonMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scenarioId};
  @override
  PracticeSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PracticeSession(
      scenarioId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scenario_id'])!,
      practiceSessionId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}practice_session_id'])!,
      stateJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state_json'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PracticeSessionsTable createAlias(String alias) {
    return $PracticeSessionsTable(attachedDatabase, alias);
  }
}

class PracticeSession extends DataClass implements Insertable<PracticeSession> {
  final String scenarioId;
  final String practiceSessionId;
  final String stateJson;
  final DateTime updatedAt;
  const PracticeSession(
      {required this.scenarioId,
      required this.practiceSessionId,
      required this.stateJson,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['scenario_id'] = Variable<String>(scenarioId);
    map['practice_session_id'] = Variable<String>(practiceSessionId);
    map['state_json'] = Variable<String>(stateJson);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PracticeSessionsCompanion toCompanion(bool nullToAbsent) {
    return PracticeSessionsCompanion(
      scenarioId: Value(scenarioId),
      practiceSessionId: Value(practiceSessionId),
      stateJson: Value(stateJson),
      updatedAt: Value(updatedAt),
    );
  }

  factory PracticeSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PracticeSession(
      scenarioId: serializer.fromJson<String>(json['scenarioId']),
      practiceSessionId: serializer.fromJson<String>(json['practiceSessionId']),
      stateJson: serializer.fromJson<String>(json['stateJson']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scenarioId': serializer.toJson<String>(scenarioId),
      'practiceSessionId': serializer.toJson<String>(practiceSessionId),
      'stateJson': serializer.toJson<String>(stateJson),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PracticeSession copyWith(
          {String? scenarioId,
          String? practiceSessionId,
          String? stateJson,
          DateTime? updatedAt}) =>
      PracticeSession(
        scenarioId: scenarioId ?? this.scenarioId,
        practiceSessionId: practiceSessionId ?? this.practiceSessionId,
        stateJson: stateJson ?? this.stateJson,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PracticeSession copyWithCompanion(PracticeSessionsCompanion data) {
    return PracticeSession(
      scenarioId:
          data.scenarioId.present ? data.scenarioId.value : this.scenarioId,
      practiceSessionId: data.practiceSessionId.present
          ? data.practiceSessionId.value
          : this.practiceSessionId,
      stateJson: data.stateJson.present ? data.stateJson.value : this.stateJson,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PracticeSession(')
          ..write('scenarioId: $scenarioId, ')
          ..write('practiceSessionId: $practiceSessionId, ')
          ..write('stateJson: $stateJson, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(scenarioId, practiceSessionId, stateJson, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PracticeSession &&
          other.scenarioId == this.scenarioId &&
          other.practiceSessionId == this.practiceSessionId &&
          other.stateJson == this.stateJson &&
          other.updatedAt == this.updatedAt);
}

class PracticeSessionsCompanion extends UpdateCompanion<PracticeSession> {
  final Value<String> scenarioId;
  final Value<String> practiceSessionId;
  final Value<String> stateJson;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PracticeSessionsCompanion({
    this.scenarioId = const Value.absent(),
    this.practiceSessionId = const Value.absent(),
    this.stateJson = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PracticeSessionsCompanion.insert({
    required String scenarioId,
    required String practiceSessionId,
    required String stateJson,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : scenarioId = Value(scenarioId),
        practiceSessionId = Value(practiceSessionId),
        stateJson = Value(stateJson),
        updatedAt = Value(updatedAt);
  static Insertable<PracticeSession> custom({
    Expression<String>? scenarioId,
    Expression<String>? practiceSessionId,
    Expression<String>? stateJson,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (scenarioId != null) 'scenario_id': scenarioId,
      if (practiceSessionId != null) 'practice_session_id': practiceSessionId,
      if (stateJson != null) 'state_json': stateJson,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PracticeSessionsCompanion copyWith(
      {Value<String>? scenarioId,
      Value<String>? practiceSessionId,
      Value<String>? stateJson,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PracticeSessionsCompanion(
      scenarioId: scenarioId ?? this.scenarioId,
      practiceSessionId: practiceSessionId ?? this.practiceSessionId,
      stateJson: stateJson ?? this.stateJson,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scenarioId.present) {
      map['scenario_id'] = Variable<String>(scenarioId.value);
    }
    if (practiceSessionId.present) {
      map['practice_session_id'] = Variable<String>(practiceSessionId.value);
    }
    if (stateJson.present) {
      map['state_json'] = Variable<String>(stateJson.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PracticeSessionsCompanion(')
          ..write('scenarioId: $scenarioId, ')
          ..write('practiceSessionId: $practiceSessionId, ')
          ..write('stateJson: $stateJson, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedReportsTable extends CachedReports
    with TableInfo<$CachedReportsTable, CachedReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jsonMeta = const VerificationMeta('json');
  @override
  late final GeneratedColumn<String> json = GeneratedColumn<String>(
      'json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, json, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_reports';
  @override
  VerificationContext validateIntegrity(Insertable<CachedReport> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('json')) {
      context.handle(
          _jsonMeta, json.isAcceptableOrUnknown(data['json']!, _jsonMeta));
    } else if (isInserting) {
      context.missing(_jsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  CachedReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedReport(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      json: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}json'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedReportsTable createAlias(String alias) {
    return $CachedReportsTable(attachedDatabase, alias);
  }
}

class CachedReport extends DataClass implements Insertable<CachedReport> {
  final String key;
  final String json;
  final DateTime cachedAt;
  const CachedReport(
      {required this.key, required this.json, required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['json'] = Variable<String>(json);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedReportsCompanion toCompanion(bool nullToAbsent) {
    return CachedReportsCompanion(
      key: Value(key),
      json: Value(json),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedReport.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedReport(
      key: serializer.fromJson<String>(json['key']),
      json: serializer.fromJson<String>(json['json']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'json': serializer.toJson<String>(json),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedReport copyWith({String? key, String? json, DateTime? cachedAt}) =>
      CachedReport(
        key: key ?? this.key,
        json: json ?? this.json,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedReport copyWithCompanion(CachedReportsCompanion data) {
    return CachedReport(
      key: data.key.present ? data.key.value : this.key,
      json: data.json.present ? data.json.value : this.json,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedReport(')
          ..write('key: $key, ')
          ..write('json: $json, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, json, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedReport &&
          other.key == this.key &&
          other.json == this.json &&
          other.cachedAt == this.cachedAt);
}

class CachedReportsCompanion extends UpdateCompanion<CachedReport> {
  final Value<String> key;
  final Value<String> json;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedReportsCompanion({
    this.key = const Value.absent(),
    this.json = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedReportsCompanion.insert({
    required String key,
    required String json,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        json = Value(json),
        cachedAt = Value(cachedAt);
  static Insertable<CachedReport> custom({
    Expression<String>? key,
    Expression<String>? json,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (json != null) 'json': json,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedReportsCompanion copyWith(
      {Value<String>? key,
      Value<String>? json,
      Value<DateTime>? cachedAt,
      Value<int>? rowid}) {
    return CachedReportsCompanion(
      key: key ?? this.key,
      json: json ?? this.json,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (json.present) {
      map['json'] = Variable<String>(json.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedReportsCompanion(')
          ..write('key: $key, ')
          ..write('json: $json, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PracticeSessionsTable practiceSessions =
      $PracticeSessionsTable(this);
  late final $CachedReportsTable cachedReports = $CachedReportsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [practiceSessions, cachedReports];
}

typedef $$PracticeSessionsTableCreateCompanionBuilder
    = PracticeSessionsCompanion Function({
  required String scenarioId,
  required String practiceSessionId,
  required String stateJson,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PracticeSessionsTableUpdateCompanionBuilder
    = PracticeSessionsCompanion Function({
  Value<String> scenarioId,
  Value<String> practiceSessionId,
  Value<String> stateJson,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PracticeSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get scenarioId => $composableBuilder(
      column: $table.scenarioId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get practiceSessionId => $composableBuilder(
      column: $table.practiceSessionId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get stateJson => $composableBuilder(
      column: $table.stateJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PracticeSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get scenarioId => $composableBuilder(
      column: $table.scenarioId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get practiceSessionId => $composableBuilder(
      column: $table.practiceSessionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get stateJson => $composableBuilder(
      column: $table.stateJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PracticeSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PracticeSessionsTable> {
  $$PracticeSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get scenarioId => $composableBuilder(
      column: $table.scenarioId, builder: (column) => column);

  GeneratedColumn<String> get practiceSessionId => $composableBuilder(
      column: $table.practiceSessionId, builder: (column) => column);

  GeneratedColumn<String> get stateJson =>
      $composableBuilder(column: $table.stateJson, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PracticeSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PracticeSessionsTable,
    PracticeSession,
    $$PracticeSessionsTableFilterComposer,
    $$PracticeSessionsTableOrderingComposer,
    $$PracticeSessionsTableAnnotationComposer,
    $$PracticeSessionsTableCreateCompanionBuilder,
    $$PracticeSessionsTableUpdateCompanionBuilder,
    (
      PracticeSession,
      BaseReferences<_$AppDatabase, $PracticeSessionsTable, PracticeSession>
    ),
    PracticeSession,
    PrefetchHooks Function()> {
  $$PracticeSessionsTableTableManager(
      _$AppDatabase db, $PracticeSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PracticeSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PracticeSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PracticeSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> scenarioId = const Value.absent(),
            Value<String> practiceSessionId = const Value.absent(),
            Value<String> stateJson = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PracticeSessionsCompanion(
            scenarioId: scenarioId,
            practiceSessionId: practiceSessionId,
            stateJson: stateJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String scenarioId,
            required String practiceSessionId,
            required String stateJson,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PracticeSessionsCompanion.insert(
            scenarioId: scenarioId,
            practiceSessionId: practiceSessionId,
            stateJson: stateJson,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PracticeSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PracticeSessionsTable,
    PracticeSession,
    $$PracticeSessionsTableFilterComposer,
    $$PracticeSessionsTableOrderingComposer,
    $$PracticeSessionsTableAnnotationComposer,
    $$PracticeSessionsTableCreateCompanionBuilder,
    $$PracticeSessionsTableUpdateCompanionBuilder,
    (
      PracticeSession,
      BaseReferences<_$AppDatabase, $PracticeSessionsTable, PracticeSession>
    ),
    PracticeSession,
    PrefetchHooks Function()>;
typedef $$CachedReportsTableCreateCompanionBuilder = CachedReportsCompanion
    Function({
  required String key,
  required String json,
  required DateTime cachedAt,
  Value<int> rowid,
});
typedef $$CachedReportsTableUpdateCompanionBuilder = CachedReportsCompanion
    Function({
  Value<String> key,
  Value<String> json,
  Value<DateTime> cachedAt,
  Value<int> rowid,
});

class $$CachedReportsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedReportsTable> {
  $$CachedReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedReportsTable> {
  $$CachedReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get json => $composableBuilder(
      column: $table.json, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedReportsTable> {
  $$CachedReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get json =>
      $composableBuilder(column: $table.json, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedReportsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedReportsTable,
    CachedReport,
    $$CachedReportsTableFilterComposer,
    $$CachedReportsTableOrderingComposer,
    $$CachedReportsTableAnnotationComposer,
    $$CachedReportsTableCreateCompanionBuilder,
    $$CachedReportsTableUpdateCompanionBuilder,
    (
      CachedReport,
      BaseReferences<_$AppDatabase, $CachedReportsTable, CachedReport>
    ),
    CachedReport,
    PrefetchHooks Function()> {
  $$CachedReportsTableTableManager(_$AppDatabase db, $CachedReportsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> json = const Value.absent(),
            Value<DateTime> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedReportsCompanion(
            key: key,
            json: json,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String json,
            required DateTime cachedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedReportsCompanion.insert(
            key: key,
            json: json,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedReportsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedReportsTable,
    CachedReport,
    $$CachedReportsTableFilterComposer,
    $$CachedReportsTableOrderingComposer,
    $$CachedReportsTableAnnotationComposer,
    $$CachedReportsTableCreateCompanionBuilder,
    $$CachedReportsTableUpdateCompanionBuilder,
    (
      CachedReport,
      BaseReferences<_$AppDatabase, $CachedReportsTable, CachedReport>
    ),
    CachedReport,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PracticeSessionsTableTableManager get practiceSessions =>
      $$PracticeSessionsTableTableManager(_db, _db.practiceSessions);
  $$CachedReportsTableTableManager get cachedReports =>
      $$CachedReportsTableTableManager(_db, _db.cachedReports);
}
