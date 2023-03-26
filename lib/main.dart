import 'package:flutter/material.dart';
import 'package:muaz_app/components/VideoPlayer.dart';
import 'package:muaz_app/components/bottomNavbar.dart';
import 'package:muaz_app/pages/downloads.dart';
import 'package:muaz_app/pages/subject_details.dart';
import 'package:muaz_app/pages/user_dashboard.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/subject_home.dart';
import 'pages/subject_details.dart';
import 'package:muaz_app/models/science1.dart';
//packages
import 'package:resize/resize.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedServices.isLoggedIn();
  if(_result){
    _defaultHome = const MyNavbar();
  }
  runApp(
    Resize(
        builder: (){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => _defaultHome,
              '/login': (context) => LoginPage(),
              '/Subjects': (context) => MyNavbar(),
              '/register': (context) =>Register(),
              // '/videoScreen' : (context) => MyVideoPlayer(),
              '/downloads' : (context) => Downloads(),
              '/subject_detail': (context) => SubjectDetails(lesson: lessons[0],),
            }
        );
    }
    )

  );
  }


