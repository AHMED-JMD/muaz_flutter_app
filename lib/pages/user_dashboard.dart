import 'package:flutter/material.dart';
import 'package:muaz_app/components/MyAppBar.dart';
import 'package:muaz_app/components/drawer.dart';
import 'package:muaz_app/pages/user_videos.dart';
import 'package:muaz_app/Api/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class UsrDashboard extends StatefulWidget {
  const UsrDashboard({Key? key}) : super(key: key);

  @override
  State<UsrDashboard> createState() => _UsrDashboardState();
}



class _UsrDashboardState extends State<UsrDashboard> {

  bool user = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isLoggedIn();
  }

  _isLoggedIn () async {
    var _result = await SharedServices.isLoggedIn();
    setState(() {
      user = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(user){
      return  FutureBuilder(
          future: APISERVICE_Auth.GetUser(),
          builder: (BuildContext context, AsyncSnapshot<Map> model){
            if(model.hasData){
              return
                Scaffold(
                  appBar: MyAppBar(context, true),
                  drawer: AppDrawer(),
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
                                      builder: (context) => UserVideos(userId: model.data!['_id'], booknum: 'الكتاب الأول', kind: 'علمي')
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
                                      builder: (context) => UserVideos(userId: model.data!['_id'], booknum: 'الكتاب الثاني', kind: 'علمي')
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
                                      builder: (context) => UserVideos(userId: model.data!['_id'], booknum: 'كتاب الأدبي', kind: 'أدبي')
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserVideos(userId: model.data!['_id'], booknum: 'الكتاب الأول', kind: 'حصص مراجعة')
                                  )
                              );
                            },
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Image.asset('assets/images/subject2.png'),
                            title: Text(' فيديوهات حصص المراجعة المتخصصة 1'),
                          ),
                        ),
                        SizedBox(height: 13,),
                        Card(
                          child: ListTile(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserVideos(userId: model.data!['_id'], booknum: 'الكتاب الثاني', kind: 'حصص مراجعة')
                                  )
                              );
                            },
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Image.asset('assets/images/subject2.png'),
                            title: Text(' فيديوهات حصص المراجعة المتخصصة 2'),
                          ),
                        ),
                        SizedBox(height: 13,),
                        Card(
                          child: ListTile(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserVideos(userId: model.data!['_id'], booknum: 'كتاب الأدبي', kind: 'حصص مراجعة')
                                  )
                              );
                            },
                            visualDensity: VisualDensity(vertical: 4),
                            leading: Image.asset('assets/images/subject2.png'),
                            title: Text(' فيديوهات حصص المراجعة الاساسية'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            } else{
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[300],
                child: Center(
                  child: SpinKitWave(
                    color: Colors.blueAccent,
                    size: 50.0,
                  ),
                ),
              );
            }
          }
      );
    } else{
      return Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text('تسجيل الدخول'),
        ),
      );

    }

  }
}
