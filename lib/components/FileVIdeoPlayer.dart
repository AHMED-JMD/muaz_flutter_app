import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class FileVideoPlayer extends StatefulWidget {
  final String subName;
  final dynamic file;
  const FileVideoPlayer({Key? key, required this.subName, required this.file}) : super(key: key);

  @override
  State<FileVideoPlayer> createState() => _FileVideoPlayerState(subName: subName, file: file);
}

class _FileVideoPlayerState extends State<FileVideoPlayer> {
  final String subName;
  final dynamic file;
  _FileVideoPlayerState({required this.subName,required this.file });
//define the video player
  late FlickManager flickManager;


  //initialize
  @override
  void initState() {
    super.initState();
    //initialize the controller
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.file(file),
    );
  }

  //dispose
  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  //build
  @override
  Widget build(BuildContext context) {
    print(file);
    return  Scaffold(
        appBar: AppBar(
          title: Text('$subName'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blueGrey[100],
          child: Center(
            child: AspectRatio(
              aspectRatio: 4/3,
              child: FlickVideoPlayer(
                flickManager: flickManager,
              ),
            ),
          ),
        )
    );
  }
}
