import 'package:flutter/material.dart';
import 'package:masroofy/consts.dart';

class WalletPage extends StatelessWidget {
  WalletPage({Key? key}) : super(key: key);
  List day = [const DropdownMenuItem(child: Text("Today"))];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: "Today",
                        child: Text("Today"),
                      ),
                      DropdownMenuItem(
                        value: "This Week",
                        child: Text("This Week"),
                      ),
                      DropdownMenuItem(
                        value: "This Month",
                        child: Text("This Month"),
                      )
                    ],
                    onChanged: (value) {},
                    value: "Today",
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "you spent",
                style: TextStyle(fontSize: 16),
              ),
            ]),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "50 EGP",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "so far",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 20,
                    child: DropdownButton(
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(
                          value: "All",
                          child: Text("All"),
                        ),
                        DropdownMenuItem(
                          value: "Expenses only",
                          child: Text("Expenses only"),
                        ),
                        DropdownMenuItem(
                          value: "Income only",
                          child: Text("Income only"),
                        )
                      ],
                      onChanged: (value) {},
                      value: "All",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Today",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 204, 229, 184),
                      child: Icon(
                        Icons.bolt,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 204, 229, 184)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                        child: Text(
                          "Bills",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "-80 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 195, 224, 237),
                      child: Icon(
                        Icons.sports_esports_outlined,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "Entertainment",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "PlayStation",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "-20 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Yesterday",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 204, 229, 184),
                      child: Icon(
                        Icons.bolt,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 204, 229, 184)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                        child: Text(
                          "Bills",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "-80 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 195, 224, 237),
                      child: Icon(
                        Icons.sports_esports_outlined,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "Entertainment",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "PlayStation",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "-20 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "December 12",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 204, 229, 184),
                      child: Icon(
                        Icons.bolt,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 204, 229, 184)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                        child: Text(
                          "Bills",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "-80 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 195, 224, 237),
                      child: Icon(
                        Icons.sports_esports_outlined,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "Entertainment",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "PlayStation",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "-20 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "December 11",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 204, 229, 184),
                      child: Icon(
                        Icons.bolt,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 204, 229, 184)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                        child: Text(
                          "Bills",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "-80 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 195, 224, 237),
                      child: Icon(
                        Icons.sports_esports_outlined,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "Entertainment",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 195, 224, 237)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8.0),
                            child: Text(
                              "PlayStation",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  "-20 EGP",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
