import 'dart:io';
import 'package:flutter/material.dart';
import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DownloadVideo extends StatefulWidget {
  final String link, subName;
  const DownloadVideo({Key? key, required this.link, required this.subName }) : super(key: key);

  @override
  State<DownloadVideo> createState() => _DownloadVideoState(link: link, subName: subName);
}

class _DownloadVideoState extends State<DownloadVideo> {
//initialize link
  final String link, subName;
  _DownloadVideoState({required this.link, required this.subName});

  bool downloading = false;
  String Progress = '';
  String downloadedImagePath = '';
  CancelToken? _cancelToken;

  //function to get permission
  Future<bool> GetPermission () async {
    return await Permission.storage.request().isGranted;
  }

  //function to get download folder path
  Future<String> DownloadFolderPath () async {
    return await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
  }

  //function to download the video
  Future DownloadFile (appDocDir, link) async {
    Dio dio = Dio();
    var downloadedImagePath = '${appDocDir.path}/Mam/$subName.mp4';
    try{
      await dio.download(
          "https://muaz-website.com/v1/vedios/app-stream?link=$link",
          downloadedImagePath,
          cancelToken: _cancelToken,
          onReceiveProgress: (received, total){
            setState(() {
              downloading = true;
              Progress = ((received / total * 100)).toStringAsFixed(2) + "%";
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
      Directory appDocDir = await getApplicationDocumentsDirectory();
      await DownloadFile(appDocDir, link).then((ImageDirPath) {
        setState(() {
          downloading = false;
          Progress = 'completed';
          downloadedImagePath = ImageDirPath;
        });
      });
    }
  }

  //stop downloading process
  void _stopDownload() {
    _cancelToken?.cancel("Download cancelled by user");
  }

  @override
  Widget build(BuildContext context) {
    return downloading && Progress != 'completed'? Column(
      children: [
        SpinKitFadingCircle(
          color: Colors.blueAccent,
          size: 40.0,
        ),
        Row(
          children: [
        //     InkWell(
        //         onTap: (){
        //           _stopDownload();
        //         },
        //         child: Icon(Icons.cancel),
        //
        //     ),
            Text('downloading: $Progress'),
          ],
        ),


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
