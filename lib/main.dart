import 'package:beats/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
