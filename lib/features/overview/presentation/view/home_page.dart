import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:masroofy/core/utils/service_locator.dart';
import 'package:masroofy/features/add_transaction/view/add_new.dart';
import 'package:masroofy/consts.dart';
import 'package:masroofy/features/goals/data/model/goals_models.dart';
import 'package:masroofy/features/overview/data/repos/overview_repo_impl.dart';
import 'package:masroofy/features/overview/presentation/manager/overview_manager/cubit/overview_cubit.dart';
import 'package:masroofy/features/wallet/data/models/transaction_model.dart';

import '../../../../components.dart';
import '../../../home/presentation/manager/home_manager/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OverviewCubit(getIt.get<OverviewRepoImpl>())..getData(),
      child:
          BlocBuilder<OverviewCubit, OverviewState>(builder: (context, state) {
        if (state is OverviewSuccess) {
          return SafeArea(
            child: Scaffold(
              floatingActionButton: const HomePageFAB(),
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        HomeBalance(balance: state.balance),
                        HomeLastWeekSpent(expenses: state.lastWeekExpenses),
                        HomaPageChart(chartData: state.chartData),
                        HomeTransactions(transactions: state.transactions),
                        HomePageGoals(goals: state.goals),
                        const SizedBox(height: 80,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({Key? key, required this.transactions})
      : super(key: key);
  final List<TransactionModel> transactions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  HomeCubit.get(context).changeNavBarPage(1);
                },
                child: Text(
                  "See more >",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              ),
            ],
          ),
          transactions.isEmpty
              ? Padding(
                padding: const EdgeInsets.only(top:16),
                child: const Text("No transactions yet"),
              )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return transactionTile(transactions[index]);
                  },
                ),
        ],
      ),
    );
  }
}

class HomeLastWeekSpent extends StatelessWidget {
  const HomeLastWeekSpent({
    super.key,
    required this.expenses,
  });
  final double expenses;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Text.rich(
        TextSpan(
            text:"You have spent this week: ", style: const TextStyle(fontSize: 16),
          children: [
            TextSpan(text: "$expenses EGP", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
          ]
        ),

      ),
    );
  }
}

class HomePageGoals extends StatelessWidget {
  const HomePageGoals({
    super.key,
    required this.goals,
  });
  final List<GoalModel> goals;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Goals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  HomeCubit.get(context).changeNavBarPage(2);
                },
                child: Text(
                  "See more >",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
              )
            ],
          ),
          goals.isEmpty
              ? Padding(
                padding: const EdgeInsets.only(top:16),
                child: const Text("No unfinished goals yet"),
              )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: goals.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          goals[index].title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "${goals[index].amount} EGP",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class HomePageFAB extends StatelessWidget {
  const HomePageFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var home = HomeCubit.get(context);
    return SpeedDial(
      icon: Icons.add,
      backgroundColor: primaryColor,
      overlayColor: Colors.black38,
      spacing: 16,
      spaceBetweenChildren: 16,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.shopping_cart_checkout_sharp),
            label: "Add New Expense",
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddNew(
                        isIncome: false,
                      )));
              home.changeNavBarPage(1);
            }),
        SpeedDialChild(
            child: const Icon(Icons.account_balance),
            label: "Add New Income",
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddNew(
                        isIncome: true,
                      )));
              home.changeNavBarPage(1);
            }),
      ],
    );
  }
}

class HomaPageChart extends StatelessWidget {
  const HomaPageChart({Key? key, required this.chartData}) : super(key: key);
  final Map<int, double> chartData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Charts",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text("Spent money last 7 days"),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(touchTooltipData:
                    BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${rod.toY.round()} EGP',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },),),
                borderData: FlBorderData(
                    border: const Border(
                        left: BorderSide(width: 2),
                        bottom: BorderSide(width: 2))),
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      maxIncluded: false,
                      showTitles: true,
                      reservedSize: 48,
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
                maxY: chartData.entries
                        .map((e) => e.value)
                        .reduce((value, element) =>
                            value > element ? value : element)
                        .round() +
                    100,
                barGroups: [
                  for (final entry in chartData.entries)
                    generateGroupData(entry.key, entry.value)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

BarChartGroupData generateGroupData(int x, double y) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: y,
        borderRadius: BorderRadius.zero,
        width: 20,
        color: primaryColor.withOpacity(0.8),
      ),
    ],
  );
}

Widget getTitles(double day, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(getDay(day.toInt()), style: style),
  );
}

String getDay(int day) {
  switch (day) {
    case 1:
      return 'Mn';
    case 2:
      return 'Te';
    case 3:
      return 'Wd';
    case 4:
      return 'Tu';
    case 5:
      return 'Fr';
    case 6:
      return 'St';
    case 7:
      return 'Sn';
    default:
      return '';
  }
}

class HomeBalance extends StatelessWidget {
  const HomeBalance({Key? key, required this.balance}) : super(key: key);
  final double balance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your remaining balance is",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "$balance EGP",
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
