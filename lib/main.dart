import 'package:flutter/material.dart';
import 'consts.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/view/home_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
        useMaterial3: false,
        primaryColor: primaryColor
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
