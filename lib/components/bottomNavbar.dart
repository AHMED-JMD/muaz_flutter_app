import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:muaz_app/Api/auth.dart';
import 'package:muaz_app/pages/downloads.dart';
import 'package:muaz_app/pages/login.dart';
import 'package:muaz_app/pages/subject_details.dart';
import 'package:muaz_app/pages/subject_home.dart';
import 'package:muaz_app/pages/user_dashboard.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({Key? key}) : super(key: key);

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _selectedIndex=0;
  late PageController _pageController;
  List links = [
    '/Subjects',
    '/subject_detail',
    '/',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: FutureBuilder(
        future: APISERVICE_Auth.GetUser(),
        builder: (BuildContext context, AsyncSnapshot<Map> model){
          if(model.hasData){
            return  Scaffold(
              resizeToAvoidBottomInset: true,
              body:  PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children: <Widget>[
                  Subject_home(data: model.data!,),
                  UsrDashboard(data: model.data!,),
                  Downloads(),
                ],
              ),
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: _selectedIndex,
                showElevation: true, // use this to remove appBar's elevation
                onItemSelected: (index) => {
                  setState(() {
                    _selectedIndex = index;
                  }),
                  if(index !=3){
                    _pageController.jumpToPage(index)
                  }else{
                    SharedServices.logout(context)
                  }

                },
                items: [
                  BottomNavyBarItem(
                    icon: Icon(Icons.apps),
                    title: Text('الرئيسية'),
                    activeColor: Colors.red,
                  ),
                  BottomNavyBarItem(
                      icon: Icon(Icons.people),
                      title: Text('فيديوهاتي'),
                      activeColor: Colors.purpleAccent
                  ),
                  BottomNavyBarItem(
                      icon: Icon(Icons.video_collection_rounded),
                      title: Text('التنزيلات'),
                      activeColor: Colors.purpleAccent
                  ),
                  BottomNavyBarItem(
                      icon: Icon(Icons.login_outlined),
                      title: Text('تسجيل الخروج'),
                      activeColor: Colors.blue
                  ),
                ],
              ),
            );
          }else{
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
      ),
    );
  }
}
