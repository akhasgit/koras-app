import 'dart:math';

/// URL-safe slug segment from a display name; falls back to "org".
/// Faithful port of `slugifyOrgName()` in `koras-web/src/lib/org-slug.ts`.
String slugifyOrgName(String name) {
  final s = name
      .trim()
      .toLowerCase()
      .replaceAll(RegExp('[\u0300-\u036f]'), '')
      .replaceAll(RegExp('[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  final sliced = s.length > 48 ? s.substring(0, 48) : s;
  return sliced.isEmpty ? 'org' : sliced;
}

/// Value for `organizations.slug` (unique, not null). 3 random bytes → 6 hex.
/// Prefer generating server-side; this is for parity / offline preview.
String newOrganizationSlug(String displayName) {
  final rnd = Random.secure();
  final bytes = List<int>.generate(3, (_) => rnd.nextInt(256));
  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  return '${slugifyOrgName(displayName)}-$hex';
}
