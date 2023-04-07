import 'package:flutter/material.dart';
import 'package:muaz_app/components/download-video.dart';
import 'package:muaz_app/models/Vedios/Vedios_request.dart';
import 'package:muaz_app/Api/Subject.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class SubjectDetails extends StatefulWidget {
  final dynamic lesson;
  const SubjectDetails({Key? key, required this.lesson}) : super(key: key);

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState(lesson: lesson);
}

class _SubjectDetailsState extends State<SubjectDetails> {
    final dynamic lesson;
     List videos = [];
    bool isLoading = false;

   _SubjectDetailsState({required this.lesson});

   @override
  void initState() {
    //set loading to true
     setState(() {
       isLoading = true;
     });
     //call api
     VediosRequest model = VediosRequest(kind: lesson!.kind, chapter: lesson!.chapter, type: lesson!.type);
     APISERVICE_Vedios.GetVedios(model).then((response){
       setState(() {
         isLoading = false;
       });
       videos = response.data ;
     });
  }
  @override
  Widget build(BuildContext context) {
     print(videos);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${lesson.title}'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ProgressHUD(
          inAsyncCall : isLoading,
          opacity: 0.4,
          key: UniqueKey(),
          child: videos.length > 0 ?  ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.subject),
                      title: Text('${videos[index].subject}'),
                      subtitle: Text('${videos[index].subName}', style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.video_collection_rounded, color: Colors.blueAccent,),
                    ),
                  ),
                );
              },
            ) : Center(child: Text('لا يوجد لديك فيديوهات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        )
      ),
        ),
    );
  }
}
