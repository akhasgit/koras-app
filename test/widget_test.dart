import 'package:flutter_test/flutter_test.dart';
import 'package:koras/features/dashboards/domain/dashboard_nav.dart';
import 'package:koras/features/ielts/domain/ielts_scoring.dart';
import 'package:koras/features/onboarding/domain/onboarding_config.dart';
import 'package:koras/shared/models/enums.dart';
import 'package:koras/shared/utils/org_slug.dart';

void main() {
  group('role normalization', () {
    test('org_member in a school is a student', () {
      expect(
        mapProfileRoleToNormalized(UserRole.orgMember, orgType: 'school'),
        NormalizedDashboardRole.student,
      );
    });

    test('org_member in a business is an org member', () {
      expect(
        mapProfileRoleToNormalized(UserRole.orgMember, orgType: 'business'),
        NormalizedDashboardRole.orgMember,
      );
    });

    test('org_manager normalizes to teacher', () {
      expect(
        mapProfileRoleToNormalized(UserRole.orgManager),
        NormalizedDashboardRole.teacher,
      );
    });

    test('super_admin has no normalized persona', () {
      expect(mapProfileRoleToNormalized(UserRole.superAdmin), isNull);
    });
  });

  group('onboarding recommender', () {
    test('uses interested program when set', () {
      expect(
        recommendProgram(interestedProgram: 'interview_prep'),
        'interview_prep',
      );
    });

    test('maps challenge to a program when unsure', () {
      expect(
        recommendProgram(
          interestedProgram: 'not_sure',
          biggestChallenge: 'accent',
        ),
        'accent_reduction',
      );
    });
  });

  group('org slug', () {
    test('slugifies and falls back to org', () {
      expect(slugifyOrgName('  Hello World!! '), 'hello-world');
      expect(slugifyOrgName('***'), 'org');
    });
  });

  group('ielts band conversion', () {
    test('maps 0-100 scores to the correct band buckets', () {
      expect(scoreToBand(95), 9.0);
      expect(scoreToBand(72), 7.0);
      expect(scoreToBand(58), 6.0);
      expect(scoreToBand(10), 4.0);
    });

    test('rounds to the nearest half band', () {
      expect(roundToNearestHalfBand(6.24), 6.0);
      expect(roundToNearestHalfBand(6.25), 6.5);
      expect(roundToNearestHalfBand(7.75), 8.0);
    });
  });
}
