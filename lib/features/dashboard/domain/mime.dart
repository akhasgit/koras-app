/// Mirror of the web helper — names the multipart file and derives the R2 key
/// extension. `audio/webm` ← Android (opus), `audio/mp4` ← iOS (aacLc).
String extensionForMime(String? mime) {
  final t = (mime ?? '').toLowerCase();
  if (t.contains('webm')) return 'webm';
  if (t.contains('ogg')) return 'ogg';
  if (t.contains('mp4') || t.contains('m4a')) return 'mp4';
  if (t.contains('wav')) return 'wav';
  if (t.contains('mpeg')) return 'mp3';
  return 'webm';
}
