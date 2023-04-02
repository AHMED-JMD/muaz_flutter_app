import 'package:flutter/material.dart';
import 'package:muaz_app/Api/Subject.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserVideos extends StatefulWidget {
  final String userId, booknum;
  const UserVideos({Key? key, required this.userId, required this.booknum}) : super(key: key);

  @override
  State<UserVideos> createState() => _UserVideosState(userId: userId, booknum: booknum);
}
//card widget
 Widget _card(BuildContext context, video){
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
         ListTile(
          leading: Icon(Icons.album),
          title: Text('${video.subject} '),
          subtitle: Text('${video.booknum} / ${video.chapter}'),
        ),
         Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            ' ${video.details}',
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    ),
  );

}


class _UserVideosState extends State<UserVideos> {
  final String userId, booknum;
  _UserVideosState({required this.userId, required this.booknum});

  List videos = [];
  bool isVideo = false;
  bool isLoading = false;

  // Future getVedios ()async {}

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    //call server
    APISERVICE_Vedios.UserVideos(userId, booknum).then((response) {
      setState(() {
        isLoading = false;
        isVideo = true;
        videos = response.videos;
      });

    }).catchError((err) {
      setState(() {
        isLoading = false;
      });
      // print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(videos);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('فيديوهاتي'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ProgressHUD(
          inAsyncCall : isLoading,
          opacity: 0.4,
          key: UniqueKey(),
          child: isVideo ?
          ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                child: _card(context, videos[index])
              );
            },
          )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text('لا يوجد لديك فيديوهات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                ],
              )  ,
        )
      ),
    );
  }
}
