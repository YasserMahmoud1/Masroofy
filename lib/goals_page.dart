import 'package:flutter/material.dart';
import 'package:masroofy/consts.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (contex) => AlertDialog(
                content: Column(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'New goal',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Budget',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                title: Text("Add new Goal"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                actions: <Widget>[
                  FloatingActionButton.extended(
                    label: Text("ADD"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:  16.0),
                  child: Text("Goals",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold), ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PlayStation 5",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "1500 EGP",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Checkbox(value: false, onChanged: (value) {})
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
