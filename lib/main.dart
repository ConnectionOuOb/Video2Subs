import 'tool/selectFile.dart';
import 'tool/conda/env.dart';
import 'tool/conda/check.dart';
import 'tool/conda/install.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Video2Subs());
}

class Video2Subs extends StatelessWidget {
  const Video2Subs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Video2Subs',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  bool installedConda = false;
  bool installedWhisper = false;

  init() async {
    await isMiniCondaInstalled().then((value) {
      installedConda = value;
      setState(() {});
    });

    await isWhisperInstalled().then((value) {
      installedWhisper = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    init();

    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('前置設定作業', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('1. 安裝 Miniconda', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 15),
            installedConda
                ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                    child: const Text('已安裝', style: TextStyle(color: Colors.white)),
                  )
                : ElevatedButton(
                    onPressed: () {
                      installMiniConda().then((value) {
                        installedConda = value;
                        setState(() {});
                      });
                    },
                    child: const Text('自動安裝'),
                  ),
            const SizedBox(height: 20),
            const Text('2. 設定神經網路模型', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 15),
            installedWhisper
                ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                    child: const Text('已安裝', style: TextStyle(color: Colors.white)),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setupWhisper();
                    },
                    child: const Text('自動安裝'),
                  ),
            const SizedBox(height: 20),
            const Divider(),
            const Text('選擇要轉換成字幕的檔案', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                selectFile();
              },
              child: const Text('選取檔案'),
            ),
          ],
        ),
      ),
    );
  }
}
