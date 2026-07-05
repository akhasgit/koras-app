import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/enums.dart';

part 'app_invitation.freezed.dart';
part 'app_invitation.g.dart';

/// Mirrors `public.org_invitations` (migration 0004). See 06 / 07.
@freezed
class AppInvitation with _$AppInvitation {
  const factory AppInvitation({
    required String id,
    @JsonKey(name: 'org_id') required String orgId,
    required String email,
    required UserRole role,
    @JsonKey(name: 'group_id') String? groupId,
    @Default(InvitationStatus.pending) InvitationStatus status,
    @JsonKey(name: 'org_name') String? orgName,
    @JsonKey(name: 'group_name') String? groupName,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppInvitation;

  factory AppInvitation.fromJson(Map<String, dynamic> json) =>
      _$AppInvitationFromJson(json);
}
