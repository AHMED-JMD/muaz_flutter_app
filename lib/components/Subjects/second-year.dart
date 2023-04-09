import 'package:flutter/material.dart';
import 'package:muaz_app/models/second_y_model.dart';
import 'package:muaz_app/Api/Subject.dart';

import 'package:image_card/image_card.dart';
import 'package:muaz_app/pages/subject_details.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class Second_Year extends StatefulWidget {

  const Second_Year({Key? key}) : super(key: key);

  @override
  State<Second_Year> createState() => _Second_YearState();
}

class _Second_YearState extends State<Second_Year> {

  bool isLoading = false;
  bool isRequested = false;

  //function to order
  void OrderBook () async {
    Navigator.pop(context, 'Cancel');
    //set the state
    setState(() {
      isLoading = true;
    });
    //call api
    String booknum = 'كتاب الصف الثاني';
    String kind = 'الصف الثاني';
    String price = '15000';
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
                          builder: (context) => SubjectDetails(lesson: lesson)
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
            Text('رياضيات الصف الثاني', style: TextStyle(
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
            InkWell(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    title: const Text('طلب الكتاب',),
                    content: const Text('هل انت متأكد من طلب كتاب الصف الثاني'),
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
              ),
              child: Container(
                height: 40,
                padding: EdgeInsets.only(right: 6, left: 6,top: 6,bottom: 6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Text('اطلب الكتاب بسعر 15000 جنيه'),
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: lessons_second.length ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context, index) => _card(context, lessons_second[index])
        ),
      ],
    );
  }
}
