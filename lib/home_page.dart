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
      case 0:
        text = 'Mn';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
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
                        builder: (context) => AddNew(
                              isIncome: false,
                            )));
                  }),
              SpeedDialChild(
                  child: const Icon(Icons.account_balance),
                  label: "Add New Income",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNew(
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
                  const Text(
                    "19.25 EGP",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "You have spent this week: 19.25 EGP",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Charts",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
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
                            maxY: 50,
                            barGroups: [
                              generateGroupData(1, 11),
                              generateGroupData(2, 11),
                              generateGroupData(3, 11),
                              generateGroupData(4, 11),
                              generateGroupData(5, 11),
                              generateGroupData(6, 11),
                              generateGroupData(1, 11),
                              generateGroupData(2, 11),
                              generateGroupData(3, 11),
                              generateGroupData(4, 11),
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
                          AppCubit.get(context).changeNavBarPage(1);
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
                  for (int i = 0; i < 3; i++)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 204, 229, 184),
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
                                      color: const Color.fromARGB(
                                          255, 204, 229, 184)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8.0),
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
                      ],
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
                          AppCubit.get(context).changeNavBarPage(2);
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
                  for (int i = 0; i < 3; i++)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "PlayStation 5",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "1500 EGP",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 32,
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
