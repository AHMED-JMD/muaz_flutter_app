import 'package:flutter/material.dart';
import 'package:muaz_app/components/FileVIdeoPlayer.dart';
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
  bool isDeleted = false;

  @override
  void initState() {
    super.initState();
    _initDownloads();
  }

  //function to get download folder path
  Future<String> DownloadFolderPath () async {
    return await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
  }

  //function to delete downloaded video
  void deleteVideo (file) async {
    Navigator.pop(context, 'Cancel');

    if (await file.exists()) {
      await file.delete();
      setState(() {
        isDeleted = true;
      });
      //call the listing function again
      _initDownloads();
    }
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
    });
  }

  String getName (file){
    String filename = file.path.split('/').last;
    return filename;
  }

  @override
  Widget build(BuildContext context) {
    print(isDeleted);
    return  Scaffold(
      appBar: AppBar(
        title: Text('الفيديوهات المحملة'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _downloads.length > 0 ?
       Padding(
        padding: EdgeInsets.only(top: 35),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: ListView.builder(
           itemCount: _downloads.length,
           itemBuilder: (context, index) => Card(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder:(context) => FileVideoPlayer(subName: getName(_downloads[index]), file: _downloads[index]) )
                  );
                },
                leading: Icon(Icons.video_library, color: Colors.blueAccent,),
                title: Text('${getName(_downloads[index])}'),
                trailing: InkWell(
                    onTap: (){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: const Text('حذف الفيديو'),
                            content: const Text('هل انت متأكد رغبتك في حذف الفيديو'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('الغاء'),
                              ),
                              TextButton(
                                onPressed: () => deleteVideo(_downloads[index]),
                                child: const Text('احذف'),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                  primary: Colors.white
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.delete, color: Colors.deepOrangeAccent,)
                ),
              ),
            ),
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
