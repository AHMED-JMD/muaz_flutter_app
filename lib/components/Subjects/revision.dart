import 'package:flutter/material.dart';
import 'package:muaz_app/models/revision.dart';
import 'package:muaz_app/Api/Subject.dart';

import 'package:muaz_app/pages/revision-details.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class RevisionMath extends StatefulWidget {

  const RevisionMath({Key? key}) : super(key: key);

  @override
  State<RevisionMath> createState() => _RevisionMathState();
}

class _RevisionMathState extends State<RevisionMath> {

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
    String kind = 'حصص مراجعة';
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

  //function to order special book
  void OrderSpecialBook () async {
    Navigator.pop(context, 'Cancel');
    //set the state
    setState(() {
      isLoading = true;
    });
    //call api
    String price = '20000';
    var details = await SharedServices.LoginDetails();
    String userId = details.user.id;

    APISERVICE_Vedios.OrderSpecialBook(price, userId).then((response) {
      //set the state
      setState(() {
        isLoading = false;
        isRequested = true;
      });

    });
  }

  //cad widget
  Widget _card(BuildContext context, lesson) {
    return Container(
      width: MediaQuery.of(context).size.width/3.3,
      height: MediaQuery.of(context).size.height/5.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RevisiontDetails(lesson: lesson)
                      )
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/${lesson.image}', height: 100, width: MediaQuery.of(context).size.width,),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '${lesson.title}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              // SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  ' ${lesson.price } جنيه ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),

            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text('حصص المراجعة 20,000 جنيه', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
            ),
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
            user ? Container(
                height: 60,
                padding: EdgeInsets.only(right: 2, left: 2,top: 6,bottom: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text('طلب الكتاب'),
                                content: const Text('هل انت متأكد من طلب كتابي المتخصصة 1 - 2'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('الغاء'),
                                  ),
                                  TextButton(
                                    onPressed: () => OrderSpecialBook(),
                                    child: const Text('طلب'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text('اطلب كتابي المتخصصة'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blueAccent,
                        )
                    ),
                    TextButton(
                        onPressed: (){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                title: const Text('طلب الكتاب'),
                                content: const Text('هل انت متأكد من طلب كتاب الاساسية'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('الغاء'),
                                  ),
                                  TextButton(
                                    onPressed: () => OrderBook(),
                                    child: const Text('طلب'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text('اطلب كتاب الأدبي'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blueAccent,
                        )
                    ),
                  ],
                ),
              ) :
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('سجل الدخول لتطلب الباب'),

                  ),
          ],
        ),
        SizedBox(height: 20,),
        GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: Revisionlessons.length ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context, index) => _card(context, Revisionlessons[index])
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
