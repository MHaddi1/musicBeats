import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:song_app/consts/colors.dart';
import 'package:song_app/consts/text_style.dart';
import 'package:song_app/controllers/player_controller.dart';
import 'package:song_app/views/player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());
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
          title: Text(
            "Beats",
            style: ourStyle(size: 18, color: whiteColor, family: 'bold'),
          ),
        ),
        body: FutureBuilder<List<SongModel>>(
            future: controller.audioQuery.querySongs(
                ignoreCase: true,
                orderType: OrderType.ASC_OR_SMALLER,
                sortType: null,
                uriType: UriType.EXTERNAL),
            builder: ((BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(child: Text("No Song Found"));
              } else {
                //print(snapshot.data);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Obx(
                              () => ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                tileColor: bgColor,
                                title: Text(
                                  snapshot.data![index].displayName,
                                  style: const TextStyle(
                                      fontSize: 15.0, color: whiteColor),
                                ),
                                subtitle: Text(
                                  "${snapshot.data![index].artist}",
                                  style: const TextStyle(
                                      fontSize: 15.0, color: whiteColor),
                                ),
                                leading: QueryArtworkWidget(
                                  id: snapshot.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: const Icon(
                                    Icons.music_note,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                ),
                                trailing: controller.playindex.value == index &&
                                        controller.isPlaying.value
                                    ? const Icon(
                                        Icons.play_arrow,
                                        color: whiteColor,
                                        size: 26.0,
                                      )
                                    : null,
                                onTap: () {
                                  Get.to(
                                    () => Player(
                                      data: snapshot.data!,
                                    ),
                                    transition: Transition.downToUp,
                                  );
                                  controller.playSong(
                                      snapshot.data![index].uri, index);
                                },
                              ),
                            ));
                      }),
                );
              }
            })));
  }
}
