import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  int icondata = (Icons.lunch_dining_outlined).codePoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Icon(IconData(icondata, fontFamily: "MaterialIcons")),
    );
  }
}
