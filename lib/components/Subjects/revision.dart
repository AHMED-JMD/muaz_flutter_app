import 'package:flutter/material.dart';
import 'package:muaz_app/models/revision.dart';

import 'package:image_card/image_card.dart';
import 'package:muaz_app/pages/subject_details.dart';

class RevisionMath extends StatelessWidget {

  const RevisionMath({Key? key}) : super(key: key);

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
            Text('حصص المراجعة', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
            ),
            InkWell(
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('طلب الكتاب'),
                  content: const Text('هل انت متأكد من طلب حصص المراجعة'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('الغاء'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
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
            itemCount: Revisionlessons.length ,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemBuilder: (context, index) => _card(context, Revisionlessons[index])
        ),
      ],
    );
  }
}
