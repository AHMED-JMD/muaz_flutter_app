
import 'package:flutter/material.dart';
import 'package:external_path/external_path.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DownloadVideo extends StatefulWidget {
  final String link;
  const DownloadVideo({Key? key,required this.link }) : super(key: key);

  @override
  State<DownloadVideo> createState() => _DownloadVideoState(link: link);
}

class _DownloadVideoState extends State<DownloadVideo> {
//initialize link
  final String link;
  _DownloadVideoState({required this.link});

  bool downloading = false;
  String Progress = '';
  String downloadedImagePath = '';

  //function to get permission
  Future<bool> GetPermission () async {
    return await Permission.storage.request().isGranted;
  }

  //function to get download folder path
  Future<String> DownloadFolderPath () async {
    return await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
  }

  //function to download the video
  Future DownloadFile (downlaodPath, link) async {
    Dio dio = Dio();
    var downloadedImagePath = '$downlaodPath/Mam/$link.mp4';
    try{
      await dio.download(
          "https://muaz-website.com/v1/vedios/app-stream?link=$link",
          downloadedImagePath,
          onReceiveProgress: (rec, total){
            setState(() {
              downloading = true;
              Progress = ((total / rec) * 100).toStringAsFixed(2);
            });
          }
      );
    }catch (e){
      print(e);
      throw e;
    }
    return downloadedImagePath;
  }

  //now when user clicks the button
  Future<void> DoDownloadFile () async {
    if( await GetPermission()){
      String imagePath = await DownloadFolderPath();
      await DownloadFile(imagePath, link).then((ImageDirPath) {
        setState(() {
          downloading = false;
          Progress = 'completed';
          downloadedImagePath = ImageDirPath;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return downloading && Progress != 'completed'? Column(
      children: [
     SpinKitFadingCircle(
    color: Colors.blueAccent,
      size: 40.0,
    ),
        Text('downloading: $Progress')
      ],
    ) : Progress != 'completed' ? TextButton.icon(
          onPressed: (){
            DoDownloadFile();
          },
          icon: Icon(Icons.download_outlined),
          label: Text('تحميل'),
          style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.redAccent,
          textStyle: TextStyle(
              color: Colors.red
          ),
        )
    ) : Text('تم التحميل');
  }
}
