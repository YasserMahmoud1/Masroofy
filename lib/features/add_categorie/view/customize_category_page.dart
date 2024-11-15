import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/core/utils/service_locator.dart';
import 'package:masroofy/features/add_categorie/manager/cubit/add_category_cubit.dart';

import '../../../components.dart';
import '../../categories/data/models/categories_model.dart';
import '../data/repo/add_category_repo_impl.dart';

class CustomizeCategoryPage extends StatelessWidget {
  const CustomizeCategoryPage(
      {super.key, required this.category, required this.isNew});
  final CategoriesModel category;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    final titleController =
        TextEditingController(text: isNew ? null : category.title);
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) =>
          AddCategoryCubit(getIt.get<AddCategoryRepoImpl>()),
      child: BlocBuilder<AddCategoryCubit, AddCategoryState>(
        builder: (context, state) {
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
                            AddCategoryCubit.get(context).insertCategory(category);
                            Navigator.pop(context, true);
                          }
                        }
                      : () {
                          if (formKey.currentState!.validate()) {
                            AddCategoryCubit.get(context).updateCategory(category);
                            Navigator.pop(context,true);
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
              body:  SingleChildScrollView(
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
                    IconData(category.icon, fontFamily: "MaterialIcons"),
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
                    onTab: (() {
                      category.changeColor(colors[i]);
                      AddCategoryCubit.get(context).changeColor(i);
                    }),
                    isSelected: i == AddCategoryCubit.get(context).selectedColor,
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
                    onTab: (() {
                      AddCategoryCubit.get(context).changeIcon(i);
                      category.changeIconData(icons[i]);
                    }),
                    isSelected: i  == AddCategoryCubit.get(context).selectedIcon,
                  )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ),
            ),
          );
        },
      ),
    );
  }
}


//  if (!isNew)
//               const Text(
//                 "Labels",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             if (!isNew)
//               const SizedBox(
//                 height: 16,
//               ),
//             if (!isNew)
//               StaggeredGrid.count(
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16,
//                 crossAxisCount: 3,
//                 children: <Widget>[
//                   // for (int i = 0; i < clabels.length; i++)
//                     // Container(
//                     //   decoration: BoxDecoration(
//                     //       color: secondaryColor,
//                     //       borderRadius: BorderRadius.circular(8)),
//                     //   child: Padding(
//                     //     padding:
//                     //         const EdgeInsetsDirectional.only(start: 8.0),
//                     //     child: SizedBox(
//                     //       height: 30,
//                     //       width: 90,
//                     //       child: Row(
//                     //         mainAxisSize: MainAxisSize.min,
//                     //         children: [
//                     //           const CircleAvatar(
//                     //             backgroundColor: Colors.black,
//                     //             radius: 3,
//                     //           ),
//                     //           const SizedBox(width: 8),
//                     //           Text(clabels[i]),
//                     //         ],
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                   // InkWell(
//                   //   onTap: () {
//                   //     showDialog(
//                   //       context: context,
//                   //       builder: (contex) => Form(
//                   //         key: dFormKey,
//                   //         child: AlertDialog(
//                   //           content: TextFormField(
//                   //             validator: (value) {
//                   //               if (value!.isEmpty) {
//                   //                 return "Label must not be empty";
//                   //               }
//                   //               return null;
//                   //             },
//                   //             controller: dialogTitleController,
//                   //             decoration: const InputDecoration(
//                   //               labelText: 'New label',
//                   //               border: OutlineInputBorder(),
//                   //             ),
//                   //           ),
//                   //           title: const Text("Add new label"),
//                   //           shape: RoundedRectangleBorder(
//                   //             borderRadius: BorderRadius.circular(20),
//                   //           ),
//                   //           actions: <Widget>[
//                   //             FloatingActionButton.extended(
//                   //               label: const Text("ADD"),
//                   //               onPressed: () {
//                   //                 if (dFormKey.currentState!.validate()) {
//                   //                   clabels.add(dialogTitleController.text);
//                   //                   // cubit.insertLabel(
//                   //                   //     title: dialogTitleController.text,
//                   //                   //     categoryID: id!);
//                   //                   Navigator.of(context).pop();
//                   //                 }
//                   //               },
//                   //             ),
//                   //           ],
//                   //         ),
//                   //       ),
//                   //     );
//                   //   },
//                   //   child: Container(
//                   //     height: 30,
//                   //     decoration: BoxDecoration(
//                   //         borderRadius: BorderRadius.circular(8),
//                   //         color: secondaryColor),
//                   //     child: const Padding(
//                   //       padding: EdgeInsetsDirectional.only(start: 8.0),
//                   //       child: Row(
//                   //         children: [
//                   //           Icon(
//                   //             Icons.add,
//                   //             size: 20,
//                   //           ),
//                   //           SizedBox(
//                   //             width: 8,
//                   //           ),
//                   //           Text("Add Label"),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   const SizedBox(
//                     height: 120,
//                   ),
//                 ],
//               ),
