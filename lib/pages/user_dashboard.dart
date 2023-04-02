import 'package:flutter/material.dart';
import 'package:muaz_app/pages/user_videos.dart';

class UsrDashboard extends StatefulWidget {
  final Map data;
  const UsrDashboard({Key? key, required this.data}) : super(key: key);

  @override
  State<UsrDashboard> createState() => _UsrDashboardState(data: data);
}

class _UsrDashboardState extends State<UsrDashboard> {
  final Map data;
  _UsrDashboardState({required this.data});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('${data['username']}'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserVideos(userId: data['_id'], booknum: 'الكتاب الأول')
                      )
                  );
                },
                visualDensity: VisualDensity(vertical: 4),
                leading: Image.asset('assets/images/subject2.jpeg'),
                title: Text('فيديوهات الرياضيات المتخصصة 1'),
              ),
            ),
            SizedBox(height: 13,),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserVideos(userId: data['_id'], booknum: 'الكتاب الثاني')
                      )
                  );;
                },
                visualDensity: VisualDensity(vertical: 4),
                leading: Image.asset('assets/images/subject3.png'),
                title: Text('فيديوهات الرياضيات المتخصصة 2'),
              ),
            ),
            SizedBox(height: 13,),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserVideos(userId: data['_id'], booknum: 'كتاب الأدبي')
                      )
                  );
                },
                visualDensity: VisualDensity(vertical: 4),
                leading: Image.asset('assets/images/4-rm.png'),
                title: Text('فيديوهات الرياضيات الاساسية'),
              ),
            ),
            SizedBox(height: 13,),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, '/subject_detail');
                },
                visualDensity: VisualDensity(vertical: 4),
                leading: Image.asset('assets/images/subject2.png'),
                title: Text('فيديوهات حصص المراجعة'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
