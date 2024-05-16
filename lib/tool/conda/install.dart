import 'dart:io';
import '../platform.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


Future<bool> installMiniConda() async {
  const installUrl = 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe';

  final tempDir = await getTemporaryDirectory();

  String installPath = tempDir.path;
  List<String> args = [];

  if (PlatformUtil.isWindows) {
    installPath += '\\miniconda_installer.exe';
    args = [
      '/InstallationType=JustMe',
      '/AddToPath=1',
      '/RegisterPython=1',
      '/S',
      '/D=%UserProfile%\\Miniconda3',
    ];
  }

  final installer = File(installPath);
  final request = await http.Client().get(Uri.parse(installUrl));

  installer.writeAsBytesSync(request.bodyBytes);

  final result = await Process.run(
    installPath,
    args
  );

  installer.deleteSync();

  return result.exitCode == 0;
}
