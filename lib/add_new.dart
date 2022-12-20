import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/app_states.dart';
import 'package:masroofy/consts.dart';

import 'components.dart';

class AddNew extends StatelessWidget {
  AddNew({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                isIncome ? "Add New Income" : "Add New Expense",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cubit.addNewValue,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24.0))),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return (Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 8,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Expanded(
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        crossAxisCount: 4,
                                        children: <Widget>[
                                          for (int i = 0; i < 50; i++)
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    child: Icon(Icons.abc),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text("title")
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16)),
                          ),
                          child: const Center(
                              child: Text(
                            "Label",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                                                    showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(24.0))),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return (Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 8,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Expanded(
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        crossAxisCount: 4,
                                        children: <Widget>[
                                          for (int i = 0; i < 50; i++)
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    child: Icon(Icons.abc),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text("title")
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                topLeft: Radius.circular(16)),
                          ),
                          child: const Center(
                              child: Text(
                            "Category",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.clearAddNewValue();
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "C",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.deleteAddNewValue();
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Icon(Icons.backspace_outlined)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("7");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "7",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("8");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "8",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("9");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "9",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("4");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("5");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("6");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("1");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("2");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("3");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue(".");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            ".",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.updateAddNewValue("0");
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                              child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor),
                    child: const Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
