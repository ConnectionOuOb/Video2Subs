import 'dart:io';
import 'package:flutter/cupertino.dart';

Future<bool> isMiniCondaInstalled() async {
  try {
    final result = await Process.run('conda', ['--version']);

    if (result.exitCode == 0) {
      return true;
    }
  } catch (e) {
    debugPrint("### Info: Conda is not installed");
  }

  return false;
}

Future<bool> isWhisperInstalled() async {
  try {
    var result = await Process.run('conda', ['activate', 'whisper', '&&', 'whisper']);

    if (result.exitCode == 0) {
      return true;
    }
  } catch (e) {
    debugPrint("### Info: Whisper is not installed");
  }

  return false;
}
