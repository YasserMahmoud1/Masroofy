import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/model.dart';

import 'app_cubit.dart';
import 'app_states.dart';
import 'consts.dart';
import 'customize_category_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: categories.isEmpty
          ? const Center(
              child: Text("Insert categories to display them"),
            )
          : ListView.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () async {
                    Timer(Duration(seconds: 1), () {});
                    Category category = Category(
                      title: categories[index]["title"],
                      color: categories[index]["color"],
                      iconData: categories[index]["icon"],
                    );
                    filterLabels(categories[index]["id"]);
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomizeCategoryPage(
                              category: category,
                              isNew: false,
                              id: categories[index]["id"],
                            )));
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                HexColor(categories[index]["color"]),
                            child: Icon(
                              IconData(categories[index]["icon"],
                                  fontFamily: "MaterialIcons"),
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            categories[index]["title"],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
              itemCount: categories.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          print(categories.length);
          Category category = Category(
              title: "",
              color: "FFAB7C",
              iconData: ((Icons.lunch_dining_outlined).codePoint));
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => CustomizeCategoryPage(
                        category: category,
                        isNew: true,
                      )))
              .then((value) {
            setState(() {});
          });
        }),
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
