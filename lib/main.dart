import 'tool/selectFile.dart';
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
            const Text(
              'Select a video file to extract subtitles',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                selectFile();
              },
              child: const Text('Select video file'),
            ),
          ],
        ),
      ),
    );
  }
}
