import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:song_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beats',
      theme: ThemeData(
          //textTheme: GoogleFonts,
        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      )),
      home: const HomePage(),
    );
  }
}
