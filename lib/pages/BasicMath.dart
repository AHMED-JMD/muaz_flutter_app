import 'package:flutter/material.dart';
import 'package:muaz_app/pages/subject_details.dart';

import 'package:image_card/image_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:muaz_app/Api/Subject.dart';
import 'package:muaz_app/components/MyAppBar.dart';
import 'package:muaz_app/components/drawer.dart';
import 'package:muaz_app/models/art.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';


class Basic extends StatefulWidget {
  const Basic({super.key});

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  bool isLoading = false;
  bool isRequested = false;

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

  //function to order
  void OrderBook () async {
    Navigator.pop(context, 'Cancel');
    //set the state
    setState(() {
      isLoading = true;
    });
    //call api
    String booknum = 'كتاب الأدبي';
    String kind = 'أدبي';
    String price = '20000';
    var details = await SharedServices.LoginDetails();
    String userId = details.user.id;

    APISERVICE_Vedios.OrderBook(kind, booknum, price, userId).then((response) {
      //set the state
      setState(() {
        isLoading = false;
        isRequested = true;
      });

    });
  }

  //cad widget
  Widget _card(BuildContext context, lesson) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 3),
      child: TransparentImageCard(
        width: MediaQuery.of(context).size.width/2.1,
        height: 400,
        imageProvider: AssetImage(
            'assets/images/${lesson.image}'
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 105,
              child: Text(
                '${lesson.title}',
                style: TextStyle(fontSize: 17,color: Colors.white,),
              ),
            ),
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30)
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectDetails(lesson: lesson)
                      )
                  );
                },
                icon: Icon(Icons.arrow_forward, color: Colors.deepOrange,),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(context),
        drawer: AppDrawer(),
        body: ListView(
          children: [
            SizedBox(height: 20,),
            Column(
              children: [
                Text('الرياضيات الاساسية', style: TextStyle(
                    fontSize: 20,
                ),
                ),
                Text(' 20,000 جنيه', style: TextStyle(color: Colors.grey, fontSize: 17),),
                SizedBox(height: 5,),
                isLoading ? SpinKitRotatingCircle(
                  color: Colors.blueAccent,
                  size: 50.0,
                ) : isRequested ? Container(
                  height: 40,
                  color: Colors.green,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Text(
                    'تم طلب الكتاب بنجاح',
                    style: TextStyle(fontSize: 18,color: Colors.white)
                    ,),
                ) :
                user?
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: TextButton(
                        onPressed: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text('طلب الكتاب'),
                                content: const Text('هل انت متأكد من طلب كتاب الأدبي'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.redAccent
                                    ),
                                    child: const Text('الغاء',
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => OrderBook(),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue
                                    ),
                                    child: const Text('طلب',
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.deepOrange
                        ),
                        child: Text('اطلب الكتاب', style: TextStyle(fontSize: 15, color: Colors.white),),
                      ),
                    ),
                  ],
                )
                    :
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text('سجل الدخول لتطلب الباب'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent, // Set the button's background color
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: Artlessons.length ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) => _card(context, Artlessons[index])
            ),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
