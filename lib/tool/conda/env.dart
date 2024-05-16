import 'dart:io';

Future<void> setupWhisper() async {
  final ret = await Process.run(
    'conda',
    [
      'create',
      '-n',
      'whisper',
      'python=3.9',
      '-y',
      '&&',
      'conda',
      'activate',
      'whisper',
      '&&',
      'conda',
      'install',
      'ffmpeg',
      '-y',
      '&&',
      'pip',
      'install',
      '-U',
      'openai-whisper',
    ],
  );

  print(ret.stdout);
  print(ret.stderr);
}
