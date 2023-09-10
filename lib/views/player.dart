import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:song_app/consts/colors.dart';
import 'package:song_app/consts/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(Icons.music_note),
            )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                color: whiteColor,
              ),
              child: Column(
                children: [
                  Text(
                    "Music Name",
                    style: ourStyle(size: 24, color: bgColor),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "Artist Name",
                    style: ourStyle(size: 20, color: bgColor),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "0:0",
                        style: ourStyle(color: bgDarkColor),
                      ),
                      Expanded(
                          child: Slider(
                              thumbColor: silderColor,
                              inactiveColor: bgColor,
                              activeColor: silderColor,
                              value: 0.0,
                              onChanged: (newVal) {})),
                      Text(
                        "04:00",
                        style: ourStyle(color: bgDarkColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_previous_rounded,
                            size: 40.0,
                            color: bgDarkColor,
                          )),
                      CircleAvatar(
                          radius: 35,
                          backgroundColor: bgDarkColor,
                          child: Transform.scale(
                            scale: 2.5,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: whiteColor,
                                )),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_next_rounded,
                            size: 40.0,
                            color: bgDarkColor,
                          ))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
