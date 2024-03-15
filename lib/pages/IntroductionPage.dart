import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:muaz_app/components/bottomNavbar.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();


  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MyNavbar()),
    );
  }

  @override
  Widget build(BuildContext context) {

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.acme(fontSize: 22.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );


    return Directionality(
        textDirection: TextDirection.rtl,
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: "مرحبا في منصة الأستاذ معاذ 😊",
              body: "تحتوي المنصة على جميع مواد رياضيات المرحلة الثانوية - (المتخصصة , الاساسية , الصف الأول , الصف الثاني)",
              image: Center(
                child: Icon(Icons.waving_hand, size: 50.0, color: Colors.deepOrange[600],),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "مشاهدة الحصص 👀 ",
              body: "يمكنك مشاهدة او تحميل الحصة الاولى من اي مادة مباشرة ومجانا على المنصة",
              image: Center(
                child: Icon(Icons.subscriptions, size: 80.0, color: Colors.deepOrange),
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "خيارات دفع رسوم الاشتراك 🤔 ",
              bodyWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('assets/images/bankk.png'),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Text('2916188',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/vodafonecash.png'),
                            fit: BoxFit.cover,
                            // colorFilter: ColorFilter.mode(Colors.black45.withOpacity(0.6), BlendMode.darken),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Text('...coming soon',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              image: Center(
                child: Icon(Icons.payments, size: 80.0, color: Colors.deepOrange),
              ),
              decoration: pageDecoration,
            ),
          ],
          allowImplicitScrolling: true,
          autoScrollDuration: 6000,
          infiniteAutoScroll: true,
          globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16),
                child: Image.asset(
                  'assets/images/app_icon.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                'الدخول الى التطبيق مباشرة!',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange[400]
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
          showNextButton: false,
          done: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.deepOrange[400]
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Go', style: TextStyle(fontSize: 17, color: Colors.white),),
                  SizedBox(width: 4,),
                  Icon(Icons.keyboard_arrow_left_sharp, color: Colors.white,size: 20,)
                ],
              )
          ),
          onDone: () {
            _onIntroEnd(context);
          },
        )
    );
  }
}
