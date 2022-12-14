import 'package:flutter/material.dart';
import 'package:masroofy/categories_page.dart';
import 'package:masroofy/consts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            color: primaryColor,
            child: const Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.dark_mode_outlined),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              "Dark mood",
                            ),
                          ],
                        ),
                        Switch(
                          activeColor: primaryColor,
                          value: isDark,
                          onChanged: (value) {
                            isDark = value;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoriesPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: const [
                      Icon(Icons.category_outlined),
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
        ],
      ),
    );
  }
}
                    // SizedBox(height: 24,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: const [
                    //         Icon(Icons.category_outlined),
                    //         SizedBox(
                    //           width: 24,
                    //         ),
                    //         Text(
                    //           "Categories",
                    //         ),
                    //       ],
                    //     ),
                    //     Switch(
                    //       activeColor: primaryColor,
                    //       value: isDark,
                    //       onChanged: (value) {
                    //         isDark = value;
                    //         setState(() {});
                    //       },
                    //     ),
                    //   ],
                    // ),