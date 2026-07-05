import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'app_organization.freezed.dart';
part 'app_organization.g.dart';

/// Mirrors `public.organizations` (migration 0004). See 06 / 07.
@freezed
class AppOrganization with _$AppOrganization {
  const factory AppOrganization({
    required String id,
    required String name,
    required OrgType type,
    @Default(OrgStatus.active) OrgStatus status,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppOrganization;

  factory AppOrganization.fromJson(Map<String, dynamic> json) =>
      _$AppOrganizationFromJson(json);
}
