import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 MyAppBar (context) {
  return AppBar(
    title: Text('Maaz Platform',
      style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold, fontSize: 24),
    ),
    backgroundColor: Colors.deepOrangeAccent,
  );
}