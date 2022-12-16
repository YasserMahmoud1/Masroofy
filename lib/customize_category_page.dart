import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/model.dart';

import 'components.dart';

List<String> colors = [
  "FFF1AB",
  "FEB8B8",
  "D7B8FE",
  "BEFEB8",
  "B8E5FE",
  "FED1B8",
  "FFE76C",
  "FA6C6C",
  "B080FF",
  "7DFF8A",
  "7D8AFF",
  "FFAB7C",
];
List<int> icons = [
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
  (Icons.lunch_dining_outlined).codePoint,
];
List labels = [
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
  "Breakfast",
];

class CustomizeCategoryPage extends StatefulWidget {
  CustomizeCategoryPage({Key? key, required this.category}) : super(key: key);
  Category category;
  @override
  State<CustomizeCategoryPage> createState() =>
      _CustomizeCategoryPageState(category: category);
}

class _CustomizeCategoryPageState extends State<CustomizeCategoryPage> {
  _CustomizeCategoryPageState({required this.category});
  Category category;

  var selectedColor = 0;
  var selectedIcon = 0;

  void changeColor(int i) {
    setState(() {
      selectedColor = i;
      category.changeColor(colors[i - 1]);
    });
  }

  void changeIcon(int i) {
    setState(() {
      selectedIcon = i;
      category.changeIconData(icons[i - 1]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: category.title);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Customize Category",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: HexColor(category.color),
                    radius: 45,
                    child: Icon(
                      IconData(category.iconData, fontFamily: "MaterialIcons"),
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: ((value) => category.changeTitle(value)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Colors",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 6,
                children: <Widget>[
                  for (int i = 0; i < colors.length; i++)
                    SelectableAvatar(
                      color: colors[i],
                      onTab: (() => changeColor(i + 1)),
                      isSelected: i + 1 == selectedColor,
                    )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Icons",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 6,
                children: <Widget>[
                  for (int i = 0; i < icons.length; i++)
                    SelectableAvatar(
                      iconData: icons[i],
                      onTab: (() => changeIcon(i + 1)),
                      isSelected: i + 1 == selectedIcon,
                    )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Labels",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              StaggeredGrid.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 3,
                children: <Widget>[
                  for (int i = 0; i < labels.length; i++)
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8.0),
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 3,
                              ),
                              const SizedBox(width: 8),
                              Text(labels[i]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        
                        color: secondaryColor
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start:8.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 20,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Add Label"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
