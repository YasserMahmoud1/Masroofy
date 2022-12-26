import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/model.dart';

import 'app_states.dart';
import 'components.dart';

class CustomizeCategoryPage extends StatelessWidget {
  CustomizeCategoryPage({required this.category, required this.isNew, this.id});
  Category category;
  final bool isNew;
  int? id;

  @override
  Widget build(BuildContext context) {
    final titleController =
        TextEditingController(text: isNew ? null : category.title);
    final dialogTitleController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var dFormKey = GlobalKey<FormState>();
    return BlocProvider(
      create: ((context) => AppCubit(InitialState())..createDatabase()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: Colors.white,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: SizedBox(
                width: 300,
                height: 60,
                child: FloatingActionButton.extended(
                  onPressed: isNew
                      ? () {
                          if (formKey.currentState!.validate()) {
                            cubit.insertCategory(
                                title: category.title,
                                icon: category.iconData,
                                color: category.color);
                            cubit.showCategories(cubit.database);
                            Timer(const Duration(seconds: 1), () {
                              Navigator.of(context).pop();
                            });
                          }
                        }
                      : () {
                          if (formKey.currentState!.validate()) {
                            cubit.updateCategory(
                                id: id!,
                                icon: category.iconData,
                                color: category.color,
                                title: category.title);
                            cubit.showCategories(cubit.database);
                            Timer(const Duration(seconds: 1), () {
                              Navigator.of(context).pop();
                            });
                          }
                        },
                  backgroundColor: primaryColor,
                  label: Text(
                    isNew ? "Add" : "Save",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                title: Text(
                  isNew ? "Add Category" : "Customize Category",
                  style: const TextStyle(color: Colors.black),
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
                              IconData(category.iconData,
                                  fontFamily: "MaterialIcons"),
                              size: 40,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Title must not be empty";
                                }
                                return null;
                              },
                              controller: titleController,
                              decoration: const InputDecoration(
                                labelText: 'Title',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: ((value) =>
                                  category.changeTitle(value)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Colors",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          for (int i = 0; i < cubit.colors.length; i++)
                            SelectableAvatar(
                              color: cubit.colors[i],
                              onTab: (() {
                                category.changeColor(cubit.colors[i]);
                                cubit.changeColor(i + 1);
                              }),
                              isSelected: i + 1 == cubit.selectedColor,
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Icons",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                          for (int i = 0; i < cubit.icons.length; i++)
                            SelectableAvatar(
                              iconData: cubit.icons[i],
                              onTab: (() {
                                category.changeIconData(cubit.icons[i]);
                                cubit.changeIcon(i + 1);
                              }),
                              isSelected: i + 1 == cubit.selectedIcon,
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (!isNew)
                        const Text(
                          "Labels",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      if (!isNew)
                        const SizedBox(
                          height: 16,
                        ),
                      if (!isNew)
                        StaggeredGrid.count(
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          crossAxisCount: 3,
                          children: <Widget>[
                            for (int i = 0; i < clabels.length; i++)
                              Container(
                                decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8.0),
                                  child: SizedBox(
                                    height: 30,
                                    width: 90,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 3,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(clabels[i]),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (contex) => Form(
                                    key: dFormKey,
                                    child: AlertDialog(
                                      content: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Label must not be empty";
                                          }
                                          return null;
                                        },
                                        controller: dialogTitleController,
                                        decoration: const InputDecoration(
                                          labelText: 'New label',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      title: const Text("Add new label"),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      actions: <Widget>[
                                        FloatingActionButton.extended(
                                          label: const Text("ADD"),
                                          onPressed: () {
                                            if (dFormKey.currentState!
                                                .validate()) {
                                              clabels.add(
                                                  dialogTitleController.text);
                                              cubit.insertLabel(
                                                  title: dialogTitleController
                                                      .text,
                                                  categoryID: id!);
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: secondaryColor),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 8.0),
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
                            const SizedBox(
                              height: 120,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
