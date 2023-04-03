import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {

  late Directory _downloadsDirectory;
  List<FileSystemEntity> _downloads = [];

  @override
  void initState() {
    super.initState();
    _initDownloads();
  }

  Future<void> _initDownloads() async {
    final externalDirectory = await getExternalStorageDirectory();
    final downloadsPath = '${externalDirectory!.path}/Downloads';
    setState(() {
      _downloadsDirectory = Directory(downloadsPath);
    });
    final downloads = _downloadsDirectory.listSync();
    setState(() {
      _downloads = downloads;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_downloads.length);
    return  Scaffold(
      appBar: AppBar(
        title: Text('الفيديوهات المحملة'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: _downloads.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.video_library),
          title: Text('hello there'),
        ),
      ),
    );
  }
}
