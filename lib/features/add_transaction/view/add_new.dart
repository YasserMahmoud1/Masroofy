import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:masroofy/consts.dart';
import '../../../core/utils/service_locator.dart';
import '../../wallet/data/models/transaction_model.dart';
import '../data/repos/add_transaction_repo_impl.dart';
import '../manager/cubit/add_transaction_cubit.dart';

class AddNew extends StatelessWidget {
  const AddNew({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddTransactionCubit(getIt.get<AddTransactionRepoImpl>()),
      child: BlocBuilder<AddTransactionCubit, AddTransactionState>(
        builder: (context, state) {
          final screenHeight = MediaQuery.of(context).size.height;

          final availableHeight = screenHeight -
              80 - // app bar
              80 - // text space
              50 - // category button
              16 - // spacer
              8 - // spacer
              8 - // spacer
              8 - // spacer
              8 - // spacer
              124; // add Button

          final buttonRowHeight = availableHeight / 5;

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
                // 80 height
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Text(
                      AddTransactionCubit.get(context).addNewValue,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // 50 height
                AddTransactionCategoryButton(isIncome: isIncome),
                // 16 height
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AddTransactionClearButton(height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionDeleteButton(height: buttonRowHeight),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddTransactionNumberButton(value: "7", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "8", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "9", height: buttonRowHeight),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AddTransactionNumberButton(value: "4", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "5", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "6", height: buttonRowHeight),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AddTransactionNumberButton(value: "1", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "2", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "3", height: buttonRowHeight),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AddTransactionNumberButton(value: ".", height: buttonRowHeight),
                          const SizedBox(width: 8),
                          AddTransactionNumberButton(value: "0", height: buttonRowHeight),
                        ],
                      ),
                    ],
                  ),
                ),
                AddTransactionButton(isIncome: isIncome),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget getAddTransactionCategoryButton(context, state) {
  if (state is TransactionGetCategoriesSuccess) {
    return (SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: Colors.grey),
          ),
          const SizedBox(
            height: 32,
          ),
          if (state.categories.isEmpty)
            const Center(
              child: Text("There is not categories inserted"),
            ),
          if (state.categories.isNotEmpty)
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 4,
                children: <Widget>[
                  for (int i = 0; i < state.categories.length; i++)
                    InkWell(
                      onTap: () {
                        AddTransactionCubit.get(context)
                            .changeCategory(state.categories[i]);
                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                HexColor(state.categories[i].color),
                            child: Icon(
                              IconData(state.categories[i].icon,
                                  fontFamily: "MaterialIcons"),
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(state.categories[i].title)
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    ));
  } else {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class AddTransactionDeleteButton extends StatelessWidget {
  const AddTransactionDeleteButton({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          AddTransactionCubit.get(context).deleteAddNewValue();
        },
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(child: Icon(Icons.backspace_outlined)),
        ),
      ),
    );
  }
}

class AddTransactionNumberButton extends StatelessWidget {
  const AddTransactionNumberButton(
      {super.key, required this.value, required this.height});
  final String value;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          AddTransactionCubit.get(context).updateAddNewValue(value);
        },
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
              child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}

class AddTransactionCategoryButton extends StatelessWidget {
  const AddTransactionCategoryButton({super.key, required this.isIncome});
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddTransactionCubit.get(context).getCategories(isIncome);
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.0))),
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: BlocProvider.of<AddTransactionCubit>(context),
                child: const BlocBuilder<AddTransactionCubit, AddTransactionState>(
                  builder: getAddTransactionCategoryButton,
                ),
              );
            });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Center(
            child: Text(
          AddTransactionCubit.get(context).selectedCategory == null
              ? "Category"
              : AddTransactionCubit.get(context).selectedCategory!.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}

class AddTransactionClearButton extends StatelessWidget {
  const AddTransactionClearButton({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          AddTransactionCubit.get(context).clearAddNewValue();
        },
        child: Container(
          height: height,
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
    );
  }
}

class AddTransactionButton extends StatelessWidget {
  const AddTransactionButton({super.key, required this.isIncome});
  final bool isIncome;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: InkWell(
        onTap: () {
          if (AddTransactionCubit.get(context).selectedCategory != null &&
              AddTransactionCubit.get(context).addNewValue.isNotEmpty) {
            AddTransactionCubit.get(context).insertTransaction(TransactionModel(
              amount:
                  double.parse(AddTransactionCubit.get(context).addNewValue),
              category: AddTransactionCubit.get(context).selectedCategory!,
              isIncome: isIncome,
              date: DateTime.now(),
            ));
            Navigator.pop(context);
          }
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AddTransactionCubit.get(context).selectedCategory != null &&
                    AddTransactionCubit.get(context).addNewValue.isNotEmpty
                ? primaryColor
                : Colors.grey,
          ),
          child: const Center(
              child: Text(
            "Add",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
