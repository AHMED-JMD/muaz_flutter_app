import 'package:flutter/material.dart';
import 'package:muaz_app/models/auth/Login_response_model.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isLoggedIn = false;
  LoginResponseModel? model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isLoggedIn();
  }

  _isLoggedIn () async {
    var _result = await SharedServices.isLoggedIn();
    var data = await SharedServices.LoginDetails();
    setState(() {
      isLoggedIn = _result;
      model = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoggedIn?
                Column(
                  children: [
                    if(model != null)
                      CircleAvatar(
                        child: Icon(Icons.person_pin),
                      ),
                      Text('مرحبا ${model!.user.username}', style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width/12
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('تفاصيل الحساب', style: TextStyle(color: Colors.grey[300]),),
                            Icon(Icons.edit, color: Colors.black45,)
                          ],
                        ),
                      )
                  ],
                ) :
                Text('الرجاء تسجيل الدخول!!', style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width/15
                ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_work, color: Colors.blueGrey, size: 25,),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/Subjects');
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_rtl_sharp, color: Colors.blueGrey, size: 25,),
            title: const Text('الرياضيات المتخصصة 1'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/math1');
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_rtl_sharp, color: Colors.blueGrey, size: 25,),
            title: const Text('الرياضيات المتخصصة 2'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/math2');
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_rtl_sharp, color: Colors.blueGrey, size: 25,),
            title: const Text('الرياضيات الاساسية'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/basic_math');
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_rtl_sharp, color: Colors.blueGrey, size: 25,),
            title: const Text('حصص المراجعة'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/revision_lessons');
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_rtl_sharp, color: Colors.blueGrey, size: 25,),
            title: const Text('رياضيات الصف الاول'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/first_class_math');
            },
          ),
          ListTile(
            leading: Icon(Icons.drive_file_move_rtl_sharp, color: Colors.blueGrey, size: 25,),
            title: const Text('رياضيات الصف الثاني',),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/second_class_math');
            },
          ),
        ],
      ),
    );
  }
}
