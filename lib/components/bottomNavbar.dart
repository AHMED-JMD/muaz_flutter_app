import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:muaz_app/pages/downloads.dart';
import 'package:muaz_app/pages/login.dart';
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

  //---------------------------------
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
  //--------------------------

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child:  FutureBuilder(
        future: SharedServices.isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> model){
          print(model);
          if(model.hasData){
            bool islogged = model.data!;

            return Scaffold(
              resizeToAvoidBottomInset: true,
              body:  PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children: <Widget>[
                  Subject_home(),
                  UsrDashboard(),
                  Downloads(),
                  LoginPage()
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
                    islogged ? SharedServices.logout(context)
                        : _pageController.jumpToPage(index) // Navigator.pushReplacementNamed(context, '/login')
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
                  islogged?
                  BottomNavyBarItem(
                      icon: Icon(Icons.login_outlined),
                      title: Text('تسجيل الخروج'),
                      activeColor: Colors.blue
                  ) : BottomNavyBarItem(
                      icon: Icon(Icons.how_to_reg_rounded),
                      title: Text('تسجيل الدخول'),
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
        },

      )

    );
  }
}
