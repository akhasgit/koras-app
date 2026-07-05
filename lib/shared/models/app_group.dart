import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_group.freezed.dart';
part 'app_group.g.dart';

/// Mirrors `public.groups` (migration 0004). See 06 / 20.
@freezed
class AppGroup with _$AppGroup {
  const factory AppGroup({
    required String id,
    @JsonKey(name: 'org_id') required String orgId,
    @JsonKey(name: 'manager_id') String? managerId,
    required String name,
    String? description,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppGroup;

  factory AppGroup.fromJson(Map<String, dynamic> json) =>
      _$AppGroupFromJson(json);
}
