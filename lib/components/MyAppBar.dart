import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 MyAppBar (context, bool isHome) {
  return AppBar(
    title: Text('Maaz Platform',
      style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold, fontSize: 24),
    ),
    actions: [
      !isHome ?
      TextButton.icon(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/Subjects');
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
        icon: Icon(Icons.arrow_forward),
        label: Text('رجوع'),
      ): Text(''),
    ],
    backgroundColor: Colors.deepOrangeAccent,
  );
}