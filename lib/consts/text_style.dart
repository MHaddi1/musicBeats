import 'package:flutter/material.dart';
import 'package:song_app/consts/colors.dart';

ourStyle({family = 'regular', double? size = 14.0, color = whiteColor}) {
  return Text(
    "Beats",
    style: TextStyle(fontSize: size, color: color),
  );
}