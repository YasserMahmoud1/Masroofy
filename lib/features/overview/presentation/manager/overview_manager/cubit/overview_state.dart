part of 'overview_cubit.dart';

class OverviewState {}

class OverviewInitial extends OverviewState {}

class OverviewLoading extends OverviewState {}
class OverviewSuccess extends OverviewState {
  final double lastWeekExpenses;
  final List<TransactionModel> transactions;
  final List<GoalModel> goals;
  final Map<int, double> chartData;
  final double balance;

  OverviewSuccess(
      { required this.lastWeekExpenses,
        required this.transactions,
        required this.goals,
        required this.chartData,
        required this.balance});



}
