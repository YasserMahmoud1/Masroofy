import 'package:flutter/material.dart';
import 'package:masroofy/main_page.dart';
import 'add_new.dart';
import 'customize_category_page.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
