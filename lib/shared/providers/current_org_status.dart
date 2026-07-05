import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/enums.dart';
import 'current_org.dart';

part 'current_org_status.g.dart';

/// Org suspension feeds the router redirect + RouterRefresh (not RLS). See 06.
@Riverpod(keepAlive: true)
Future<OrgStatus?> currentOrgStatus(Ref ref) async {
  final org = await ref.watch(currentOrgProvider.future);
  return org?.status;
}
