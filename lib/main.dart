import 'package:flutter/material.dart';
import 'package:muaz_app/components/bottomNavbar.dart';
import 'package:muaz_app/pages/BasicMath.dart';
import 'package:muaz_app/pages/FirstClassMath.dart';
import 'package:muaz_app/pages/IntroductionPage.dart';
import 'package:muaz_app/pages/Math1.dart';
import 'package:muaz_app/pages/Math2.dart';
import 'package:muaz_app/pages/Revisions.dart';
import 'package:muaz_app/pages/SecondClassMath.dart';
import 'package:muaz_app/pages/downloads.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';
import 'pages/login.dart';
import 'pages/register.dart';
//packages
import 'package:resize/resize.dart';

Widget _defaultHome = const OnBoardingScreen();
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
            theme: ThemeData(
              fontFamily: 'Cairo'
            ),
            routes: {
              '/': (context) => _defaultHome,
              '/login': (context) => LoginPage(),
              '/Subjects': (context) => MyNavbar(),
              '/math1': (context)=> Math1(),
              '/math2': (context)=> Math2(),
              '/basic_math': (context)=> Basic(),
              '/revision_lessons': (context)=> Revisions(),
              '/first_class_math': (context)=> FirstClass(),
              '/second_class_math': (context)=> SecondClass(),
              '/register': (context) =>Register(),
              // '/videoScreen' : (context) => MyVideoPlayer(),
              '/downloads' : (context) => Downloads(),
            }
        );
      }
    )
  );
  }


