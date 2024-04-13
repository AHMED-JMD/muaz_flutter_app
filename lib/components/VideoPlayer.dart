import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';
import 'dart:io';

class MyVideoPlayer extends StatefulWidget {
  final String subName;
  final String link;
  const MyVideoPlayer({Key? key, required this.subName, required this.link}) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<MyVideoPlayer> {
//define the video player
  VideoPlayerController? _controller;

  // initialize
  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  Future<void> _initVideoPlayer() async {
    final url = Uri.parse('https://muaz-website.com/v1/vedios/streamChunk?link=${widget.link}');
    const startByte = 0;
    const endByte = 99999;

    final response = await get(
      url,
      headers: {'range': 'bytes=0-'},
    );
    print(response.bodyBytes);
    if (response.statusCode == 206) {
      // Successfully received the requested byte range
      final videoBytes = response.bodyBytes;

      //create file and save butes inside it
      final tempDir = await getTemporaryDirectory();
      final tempVideoPath = '${tempDir.path}/video.mp4';
      await File(tempVideoPath).writeAsBytes(videoBytes);

      //set state to play the controller once data received
      setState(() {
        _controller = VideoPlayerController.file(File(tempVideoPath));
      });
    } else {
      // Handle the case when the server does not support byte ranges
      // or the requested range is invalid
      // ...
    }
  }


  //dispose
  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('${widget.subName}'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
       body: Container(
         color: Colors.white70,
         child: _controller != null ? Center(
           child: AspectRatio(
             aspectRatio: 16 / 9,
             child: FlickVideoPlayer(
               flickManager: FlickManager(
                   videoPlayerController: _controller!
               ),
             ),
           ),
         ) : Container(),
         ),
       );
  }
}
