import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/app_states.dart';
import 'package:masroofy/consts.dart';

import 'components.dart';

class AddNew extends StatelessWidget {
  const AddNew({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialState())..createDatabase(),
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
                style: const TextStyle(color: Colors.black),
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
                          if (cubit.categoryID != null) {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24.0))),
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return (SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Column(
                                    children: [
                                      const SizedBox(
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
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      Expanded(
                                        child: StaggeredGrid.count(
                                          mainAxisSpacing: 16,
                                          crossAxisSpacing: 16,
                                          crossAxisCount: 3,
                                          children: <Widget>[
                                            for (int i = 0;
                                                i < clabels.length;
                                                i++)
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      cubit.changeLabelID(
                                                          i, clabels[i]);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: secondaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .only(
                                                                start: 8.0),
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 90,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .black,
                                                                radius: 3,
                                                              ),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(clabels[i]),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: cubit.categoryID != null
                                ? primaryColor
                                : Colors.grey,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16)),
                          ),
                          child: Center(
                              child: Text(
                            cubit.labelID == null ? "Label" : cubit.labelTitle,
                            style: const TextStyle(
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
                              return (SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  children: [
                                    const SizedBox(
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
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    if (categories.isEmpty)
                                      const Center(
                                        child: Text(
                                            "There is not categories inserted"),
                                      ),
                                    if (categories.isNotEmpty)
                                      Expanded(
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 16,
                                          crossAxisCount: 4,
                                          children: <Widget>[
                                            for (int i = 0;
                                                i < categories.length;
                                                i++)
                                              InkWell(
                                                onTap: () {
                                                  filterLabels(
                                                      categories[i]["id"]);
                                                  cubit.changeCategoryID(i,
                                                      categories[i]["title"]);
                                                  Navigator.pop(context);
                                                },
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 25,
                                                      backgroundColor: HexColor(
                                                          categories[i]
                                                              ["color"]),
                                                      child: Icon(
                                                        IconData(
                                                            categories[i]
                                                                ["icon"],
                                                            fontFamily:
                                                                "MaterialIcons"),
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    Text(categories[i]["title"])
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
                          child: Center(
                              child: Text(
                            cubit.categoryID == null
                                ? "Category"
                                : cubit.categoryTitle,
                            style: const TextStyle(
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
                  child: InkWell(
                    onTap: () {
                      if (cubit.categoryID != null &&
                          cubit.addNewValue.isNotEmpty) {
                        cubit.insertTransaction(
                          label: cubit.labelTitle,
                          categoryID: categories[cubit.categoryID!]["id"],
                          amount: double.parse(cubit.addNewValue),
                          isIncome: isIncome,
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: cubit.categoryID != null &&
                                cubit.addNewValue.isNotEmpty
                            ? primaryColor
                            : Colors.grey,
                      ),
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
