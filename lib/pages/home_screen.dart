import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _openYouTubeURL() async {
    await launchUrl(Uri.parse('https://youtube.com/channel/UC6jlYIiB-_ckrAXBKsNRsvw'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://drive.google.com/uc?export=download&id=1tqkpVzkwttJBfFDghTLfDowdOZ_cEfgc',
              width: 400,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openYouTubeURL,
        tooltip: 'Open Link',
        child: const Icon(Icons.open_in_browser),
      ),
    );
  }
}
