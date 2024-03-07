import 'package:flutter/material.dart';
import 'package:muaz_app/components/VideoPlayer.dart';
import 'package:muaz_app/components/download-video.dart';
import 'package:muaz_app/Api/Subject.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class RevisiontDetails extends StatefulWidget {
  final dynamic lesson;
  const RevisiontDetails({Key? key, required this.lesson}) : super(key: key);

  @override
  State<RevisiontDetails> createState() => _RevisionDetailsState(lesson: lesson);
}

class _RevisionDetailsState extends State<RevisiontDetails> {
  final dynamic lesson;
  List videos = [];
  bool isLoading = false;

  _RevisionDetailsState({required this.lesson});

  @override
  void initState() {
    //set loading to true
    setState(() {
      isLoading = true;
    });
    //call api

    APISERVICE_Vedios.GetRevisionVedios(lesson!.kind, lesson!.booknum, lesson!.type).then((response){
      setState(() {
        isLoading = false;
      });
      videos = response.data;
    });
  }
  @override
  Widget build(BuildContext context) {
    print(videos);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('حصص المراجعة'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ProgressHUD(
          inAsyncCall : isLoading,
          opacity: 0.4,
          key: UniqueKey(),
          child: videos.length > 0 ? ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                child: index == 0 ?
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.subject),
                        title: Text('${videos[index].subject}'),
                        subtitle: Text('${videos[index].subName}', style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: Icon(Icons.video_collection_rounded, color: Colors.blueAccent,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(11.0),
                        child: Text(
                          ' ${videos[index].details}',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton.icon(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder:(context) => MyVideoPlayer(subName: videos[index].subName, link: videos[index].link,)
                                )
                                );
                              },
                              icon: Icon(Icons.play_arrow),
                              label: Text('مشاهدة'),
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.blueAccent,
                                  textStyle: TextStyle(
                                      color: Colors.red
                                  )
                              ),
                            ),
                            DownloadVideo(link: videos[index].link, subName: videos[index].subName,)

                          ],
                        ),
                      )
                    ],
                  ),
                )
                : Card(
                  child: ListTile(
                    leading: Icon(Icons.subject),
                    title: Text('${videos[index].subject}'),
                    subtitle: Text('${videos[index].subName}', style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.video_collection_rounded, color: Colors.blueAccent,),
                  ),
                ),
              );
            },
          ) :  Center(child: Text('لا يوجد لديك فيديوهات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
        ),
      ),
    );
  }
}
