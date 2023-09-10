import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:song_app/consts/colors.dart';
import 'package:song_app/consts/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ourStyle(
              family: GoogleFonts.openSansTextTheme,
              color: whiteColor,
              size: 18)),
      body: Container(),
    );
  }
}
