import 'package:flutter/material.dart';
import 'package:muaz_app/components/download-video.dart';
import 'package:muaz_app/models/Vedios/Vedios_request.dart';
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
          child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.subject),
                    title: Text('${videos[index].subject}'),
                    subtitle: Text('${videos[index].subName}', style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: DownloadVideo(link: videos[index].link, subName: videos[index].subName,),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
