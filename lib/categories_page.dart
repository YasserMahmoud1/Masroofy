import 'package:flutter/material.dart';
import 'package:masroofy/model.dart';

import 'consts.dart';
import 'customize_category_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () {
              Category category = Category(
                  title: "Food",
                  color: "FFAB7C",
                  iconData: ((Icons.lunch_dining_outlined).codePoint));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CustomizeCategoryPage(category: category)));
            },
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: const [
                    CircleAvatar(
                      child: Icon(
                        Icons.lunch_dining_outlined,
                        color: Colors.black,
                      ),
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 245, 241, 175),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      "Categories",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 16,
        ),
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (() {
          Category category = Category(
              title: "Food",
              color: "FFAB7C",
              iconData: ((Icons.lunch_dining_outlined).codePoint));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CustomizeCategoryPage(category: category)));
        }),
        backgroundColor: primaryColor,
      ),
    );
  }
}
