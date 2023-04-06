import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:external_path/external_path.dart';
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

  //function to get download folder path
  Future<String> DownloadFolderPath () async {
    return await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
  }

  Future<void> _initDownloads() async {
    final externalDirectory = await getApplicationDocumentsDirectory();
    final downloadsPath = '${externalDirectory.path}/Mam';
    setState(() {
      _downloadsDirectory = Directory(downloadsPath);
    });
    final downloads = _downloadsDirectory.listSync();
    setState(() {
      _downloads = downloads;
      print(_downloads);
    });
  }

  String getName (file){
    String filename = file.path.split('/').last;
    print(filename);
    return filename;
  }

  @override
  Widget build(BuildContext context) {
    print(_downloads);
    return  Scaffold(
      appBar: AppBar(
        title: Text('الفيديوهات المحملة'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _downloads.length > 0 ?Padding(
        padding: EdgeInsets.only(top: 35),
        child: ListView.builder(
         itemCount: _downloads.length,
         itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.video_library, color: Colors.blueAccent,),
            title: Text('${getName(_downloads[index])}'),
          ),
        ),
       ),
      )  : Center(child: Text(
              'لايوجد فيديوهات محملة الان',
              style: TextStyle(fontSize: 20),
      ),
      ),
    );
  }
}
