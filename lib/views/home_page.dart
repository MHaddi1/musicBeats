import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:song_app/consts/colors.dart';
import 'package:song_app/consts/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
          backgroundColor: bgDarkColor,
          leading: const Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: whiteColor,
                ))
          ],
          title: ourStyle(
              family: GoogleFonts.openSansTextTheme(),
              color: whiteColor,
              size: 18)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
               
                  margin: const EdgeInsets.only(bottom: 4.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                  child:  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    tileColor: bgColor,
                    title: const Text(
                      "Music Name",
                      style: TextStyle(fontSize: 15.0, color: whiteColor),
                    ),
                    subtitle: const Text(
                      "Artist Name",
                      style: TextStyle(fontSize: 15.0, color: whiteColor),
                    ),
                    leading: const Icon(
                      Icons.music_note,
                      color: whiteColor,
                      size: 32,
                    ),
                    trailing: const Icon(
                      Icons.play_arrow,
                      color: whiteColor,
                      size: 26.0,
                    ),
                  ));
            }),
      ),
    );
  }
}
