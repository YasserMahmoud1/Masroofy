import 'package:flutter/material.dart';
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
    Category category = Category(
        title: "Food",
        color: "FFAB7C",
        iconData: ((Icons.lunch_dining_outlined).codePoint));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomizeCategoryPage(
        category: category,
      ),
    );
  }
}
