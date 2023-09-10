import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:on_audio_query/on_audio_query.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:song_app/consts/colors.dart';
import 'package:song_app/consts/text_style.dart';
import 'package:song_app/controllers/player_controller.dart';

class Player extends StatelessWidget {
  final SongModel data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: QueryArtworkWidget(
                      id: data.id,
                      type: ArtworkType.AUDIO,
                      artworkHeight: double.infinity,
                      artworkWidth: double.infinity,
                      nullArtworkWidget: const Icon(
                        Icons.music_note,
                        color: whiteColor,
                        size: 48,
                      ),
                    ))),
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
                    data.displayNameWOExt,
                    style: ourStyle(size: 24, color: bgColor),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    data.artist.toString(),
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
                      Obx(
                        () => CircleAvatar(
                            radius: 35,
                            backgroundColor: bgDarkColor,
                            child: Transform.scale(
                              scale: 2.5,
                              child: IconButton(
                                  onPressed: () {
                                    if (controller.isPlaying.value) {
                                      controller.audioPlayer.pause();
                                      controller.isPlaying(false);
                                    } else {
                                      controller.audioPlayer.play();
                                      controller.isPlaying(true);
                                    }
                                  },
                                  icon: controller.isPlaying.value
                                      ? const Icon(
                                          Icons.pause,
                                          color: whiteColor,
                                        )
                                      : const Icon(
                                          Icons.play_arrow_rounded,
                                          color: whiteColor,
                                        )),
                            )),
                      ),
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
