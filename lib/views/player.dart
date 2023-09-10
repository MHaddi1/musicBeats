import 'package:beats/consts/colors.dart';
import 'package:beats/consts/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controllers/player_controller.dart';


class Player extends StatelessWidget {
  final List<SongModel> data;
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
            Obx(
              () => Expanded(
                  child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: QueryArtworkWidget(
                        id: data[controller.playindex.value].id,
                        type: ArtworkType.AUDIO,
                        artworkHeight: double.infinity,
                        artworkWidth: double.infinity,
                        nullArtworkWidget: const Icon(
                          Icons.music_note,
                          color: whiteColor,
                          size: 48,
                        ),
                      ))),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                color: whiteColor,
              ),
              child: Obx(
                () => Column(
                  children: [
                    Text(
                      data[controller.playindex.value].displayNameWOExt,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: ourStyle(size: 24, color: bgColor),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      data[controller.playindex.value].artist.toString(),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: ourStyle(size: 20, color: bgColor),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Obx(
                      () => Row(
                        children: [
                          Text(
                            controller.position.value,
                            style: ourStyle(color: bgDarkColor),
                          ),
                          Expanded(
                              child: Slider(
                                  thumbColor: silderColor,
                                  inactiveColor: bgColor,
                                  activeColor: silderColor,
                                  min: const Duration(seconds: 0)
                                      .inSeconds
                                      .toDouble(),
                                  max: controller.max.value,
                                  value: controller.value.value,
                                  onChanged: (newVal) {
                                    controller
                                        .changeDurationSecond(newVal.toInt());
                                    newVal = newVal;
                                  })),
                          Text(
                            controller.duration.value,
                            style: ourStyle(color: bgDarkColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.playSong(
                                  data[controller.playindex.value - 1].uri,
                                  controller.playindex.value - 1);
                            },
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
                            onPressed: () {
                              controller.playSong(
                                  data[controller.playindex.value + 1].uri,
                                  controller.playindex.value + 1);
                            },
                            icon: const Icon(
                              Icons.skip_next_rounded,
                              size: 40.0,
                              color: bgDarkColor,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
