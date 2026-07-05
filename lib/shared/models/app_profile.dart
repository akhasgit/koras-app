import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'app_profile.freezed.dart';
part 'app_profile.g.dart';

/// Mirrors `public.profiles` (migrations 0003/0007/0014). The `role` decodes via
/// `@JsonValue` on [UserRole]. See `all_docs/mobile/07-data-schema.md`.
@freezed
class AppProfile with _$AppProfile {
  const factory AppProfile({
    required String id,
    required String email,
    required UserRole role,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'org_id') String? orgId,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'role_title') String? roleTitle,
    @JsonKey(name: 'onboarding_completed')
    @Default(false)
    bool onboardingCompleted,
    @JsonKey(name: 'is_test_account') @Default(false) bool isTestAccount,
  }) = _AppProfile;

  factory AppProfile.fromJson(Map<String, dynamic> json) =>
      _$AppProfileFromJson(json);
}
