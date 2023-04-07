import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String subName;
  final String link;
  const MyVideoPlayer({Key? key, required this.subName, required this.link}) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _VideoPlayerState(subName: subName, link: link);
}

class _VideoPlayerState extends State<MyVideoPlayer> {
  final String subName;
  final String link;
  _VideoPlayerState({required this.subName,required this.link });
//define the video player
  late FlickManager flickManager;


  //initialize
  @override
  void initState() {
    super.initState();
    //initialize the controller 
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network("https://muaz-website.com/v1/vedios/app-stream?link=$link"),
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
    print(link);
    return  Scaffold(
      appBar: AppBar(
        title: Text('$subName'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey[300],
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
