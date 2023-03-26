import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){},
            icon: Icon(Icons.dashboard, color: Colors.deepOrangeAccent,)
        ),
        IconButton(onPressed: (){},
            icon: Icon(Icons.search_off, color: Colors.grey[500],)
        ),
      ],
    );
  }
}
