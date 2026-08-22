import 'dart:io';
import 'dart:typed_data';

/// Wait until [file] stops growing so iOS can finish writing the container.
Future<File> waitForFinalizedRecording(File file) async {
  var lastSize = -1;
  for (var i = 0; i < 20; i++) {
    if (await file.exists()) {
      final size = await file.length();
      if (size > 800 && size == lastSize) return file;
      lastSize = size;
    }
    await Future<void>.delayed(const Duration(milliseconds: 150));
  }
  return file;
}

/// True when the file has enough bytes and, for MP4/M4A, a `moov` atom.
Future<bool> isPlayableRecording(File file) async {
  if (!await file.exists()) return false;
  final bytes = await file.readAsBytes();
  if (bytes.length < 800) return false;
  final name = file.path.toLowerCase();
  if (name.endsWith('.mp4') || name.endsWith('.m4a')) {
    return _hasAtom(bytes, 'moov');
  }
  return true;
}

bool _hasAtom(Uint8List bytes, String atom) {
  final needle = atom.codeUnits;
  for (var i = 0; i <= bytes.length - needle.length; i++) {
    var ok = true;
    for (var j = 0; j < needle.length; j++) {
      if (bytes[i + j] != needle[j]) {
        ok = false;
        break;
      }
    }
    if (ok) return true;
  }
  return false;
}
