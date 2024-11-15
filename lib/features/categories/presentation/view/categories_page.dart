import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/features/categories/data/models/categories_model.dart';

import '../../../../consts.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../add_categorie/view/customize_category_page.dart';
import '../../data/repos/categories_repo_impl.dart';
import '../manager/cubit/categories_cubit.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(getIt.get<CategoriesRepoImpl>())..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
          return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
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
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          "Expenses",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Incomes",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )),
              body: const TabBarView(children: [
                ExpenseCategoriesList(),
                IncomeCategoriesList(),
              ]),
              floatingActionButton: SpeedDial(
                icon: Icons.add,
                backgroundColor: primaryColor,
                overlayColor: Colors.black38,
                spacing: 16,
                spaceBetweenChildren: 16,
                children: [
                  SpeedDialChild(
                      child: const Icon(Icons.arrow_circle_up),
                      label: "Add New Expense Category",
                      onTap: (() async {
                        CategoriesModel category = CategoriesModel(
                            title: "",
                            color: colors[0],
                            icon: (icons[0]),
                            isIncome: false);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomizeCategoryPage(
                              category: category,
                              isNew: true,
                            ),
                          ),
                        );
                        categoriesCubit.getCategories();
                      })),
                  SpeedDialChild(
                      child: const Icon(Icons.arrow_circle_down),
                      label: "Add New Income Category",
                      onTap: (() async {
                        CategoriesModel category = CategoriesModel(
                            title: "",
                            color: colors[0],
                            icon: (icons[0]),
                            isIncome: true);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomizeCategoryPage(
                              category: category,
                              isNew: true,
                            ),
                          ),
                        );
                        categoriesCubit.getCategories();
                      })),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class IncomeCategoriesList extends StatelessWidget {
  const IncomeCategoriesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.only(top: 16, bottom: 60),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            if(state.incomeCategories.isNotEmpty)
            {
              CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
              return ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomizeCategoryPage(
                                category: state.incomeCategories[index],
                                isNew: false,
                              )));
                      categoriesCubit.getCategories();
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
                                  HexColor(state.incomeCategories[index].color),
                              child: Icon(
                                IconData(state.incomeCategories[index].icon,
                                    fontFamily: "MaterialIcons"),
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(state.incomeCategories[index].title)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: state.incomeCategories.length,
              );
    
            }
            else {
              return const Center(
                child: Text("No Income Categories Yet"),
              );
            }
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
class ExpenseCategoriesList extends StatelessWidget {
  const ExpenseCategoriesList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16,bottom: 60),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            if(state.expenseCategories.isNotEmpty)
            {
              CategoriesCubit categoriesCubit = CategoriesCubit.get(context);
              return ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CustomizeCategoryPage(
                                category: state.expenseCategories[index],
                                isNew: false,
                              )));
                      categoriesCubit.getCategories();
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
                                  HexColor(state.expenseCategories[index].color),
                              child: Icon(
                                IconData(state.expenseCategories[index].icon,
                                    fontFamily: "MaterialIcons"),
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(state.expenseCategories[index].title)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: state.expenseCategories.length,
              );
    
            }
            else {
              return const Center(
                child: Text("No Expense Categories Yet"),
              );
            }
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
