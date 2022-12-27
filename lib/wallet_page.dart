import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/app_states.dart';
import 'package:masroofy/components.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/model.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
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
                        onChanged: (value) {
                          cubit.changeTodayOption(value!);
                        },
                        value: cubit.todayOptions,
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
                Text(
                  "${cubit.optionSpends} EGP",
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
                          onChanged: (value) {
                            cubit.changeIncomeOption(value!);
                          },
                          value: cubit.incomOptions,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                if (transactions.isEmpty)
                  Text("There is no transactions, insert some"),
                if (transactions.isNotEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: transactions.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: Key(transactions[index]["id"].toString()),
                        onDismissed: (dir) {
                          cubit.deleteTransaction(
                              id: transactions[index]["id"]);
                        },
                        child: transactionTile(
                          color: transactions[index]["color"],
                          title: transactions[index]["title"],
                          icon: (Icons.lunch_dining_outlined).codePoint,
                          amount: transactions[index]["amount"].toString(),
                          label: transactions[index]["label"] == ""
                              ? null
                              : transactions[index]["label"],
                          isIncome: transactions[index]["is_income"] == 1
                              ? true
                              : false,
                          day: transactions[index]["day"],
                          month: transactions[index]["month"],
                          year: transactions[index]["year"],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
