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
