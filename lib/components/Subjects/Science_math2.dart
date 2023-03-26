import 'package:flutter/material.dart';
import 'package:muaz_app/Api/Subject.dart';
import 'package:muaz_app/models/science2.dart';
import 'package:image_card/image_card.dart';
import 'package:muaz_app/pages/subject_details.dart';
import 'package:muaz_app/shared_services/SharedServices.dart';

class Science_2 extends StatefulWidget {

  const Science_2({Key? key}) : super(key: key);

  @override
  State<Science_2> createState() => _Science_2State();
}

class _Science_2State extends State<Science_2> {

  bool isLoading = false;
  bool isRequested = false;

  //function to order
  void OrderBook () async {
    //set the state
    setState(() {
      isLoading = true;
    });
    //call api
    String booknum = 'علمي';
    String kind = 'الكتاب الثاني';
    var details = await SharedServices.LoginDetails();
    String userId = details.user.id;

    APISERVICE_Vedios.OrderBook(kind, booknum, userId).then((response) {
      //set the state
      setState(() {
        isLoading = false;
        isRequested = true;
      });
      print(response);
    });

  }
  //cad widget
  Widget _card(BuildContext context, lesson) {
        return InkWell(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubjectDetails(lesson: lesson)
                )
            );
          },
          child: FillImageCard(
              width: MediaQuery.of(context).size.width/2.3,
              heightImage: MediaQuery.of(context).size.height/7.2,
              height: 700.0,
              imageProvider: AssetImage('assets/images/${lesson.image}'),
              title: Text('${lesson.title}'),
              description: Text(' ${lesson.price } جنيه ')),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text('الرياضيات المتخصصة 2', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
            ),
            InkWell(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('طلب الكتاب'),
                  content: const Text('هل انت متأكد من طلب كتاب المتخصصة 2'),
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
            itemCount: lessons2.length ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context, index) => _card(context, lessons2[index])
        ),
      ],
    );
  }
}
