import 'package:animate_icons/animate_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:masroofy/add_new.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/app_states.dart';
import 'package:masroofy/consts.dart';

import 'components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          borderRadius: BorderRadius.zero,
          width: 20,
          color: primaryColor,
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Mn';
        break;
      case 2:
        text = 'Te';
        break;
      case 3:
        text = 'Wd';
        break;
      case 4:
        text = 'Tu';
        break;
      case 5:
        text = 'Fr';
        break;
      case 6:
        text = 'St';
        break;
      case 7:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return SafeArea(
            child: Scaffold(
          floatingActionButton: SpeedDial(
            icon: Icons.add,
            backgroundColor: primaryColor,
            overlayColor: Colors.black38,
            spacing: 16,
            spaceBetweenChildren: 16,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.shopping_cart_checkout_sharp),
                  label: "Add New Expense",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddNew(
                              isIncome: false,
                            )));
                  }),
              SpeedDialChild(
                  child: const Icon(Icons.account_balance),
                  label: "Add New Income",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddNew(
                              isIncome: true,
                            )));
                  }),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your remaining balance is",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "${income - spends} EGP",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "You have spent this week: $weekSpends EGP",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Charts",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    children: [
                      const Text("Spent money last 10 days"),
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            borderData: FlBorderData(
                                border: const Border(
                                    left: BorderSide(width: 2),
                                    bottom: BorderSide(width: 2))),
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 44,
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: false,
                                ),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: false,
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: getTitles,
                                ),
                              ),
                            ),
                            maxY: 200,
                            barGroups: [
                              for(int i = 0; i< days.length;i++)
                              generateGroupData(
                                days[i].weekday,
                                daysSpent[i] ?? 0
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Transactions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.changeNavBarPage(1);
                        },
                        child: Text(
                          "See more",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeTransactions.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return transactionTile(
                        color: homeTransactions[index]["color"], 
                        title: homeTransactions[index]["title"], 
                        icon: homeTransactions[index]["icon"], 
                        amount: homeTransactions[index]["amount"].toString(),
                        label: homeTransactions[index]["label"] == ""
                            ? null
                            : homeTransactions[index]["label"],
                        isIncome: homeTransactions[index]["is_income"] == 1
                            ? true
                            : false,
                        day: homeTransactions[index]["day"],
                        month: homeTransactions[index]["month"],
                        year: homeTransactions[index]["year"],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Goals",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          cubit.changeNavBarPage(2);
                        },
                        child: Text(
                          "See more",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  if(cubit.homeGoals.isEmpty)
                  const Text("There is no goals yet, please add some"),
                  if(cubit.homeGoals.isNotEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cubit.homeGoals.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cubit.homeGoals[index]["title"],
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${cubit.homeGoals[index]["amount"]} EGP",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        );
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
