import 'package:flutter/material.dart';
import 'package:masroofy/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int indexSelected = 0;
  void checkOption(index) {
    setState(() {
      indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 6,
        children: <Widget>[
          for (int i = 0; i < 12; i++)
            SelectableAvatar(
              color: Colors.red,
              onTab: () => checkOption(i+1),
              isSelected: i+1 == indexSelected,
            )
        ],
      ),
    );
  }
}
