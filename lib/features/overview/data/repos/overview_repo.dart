import '../../../goals/data/model/goals_models.dart';
import '../../../wallet/data/models/transaction_model.dart';

abstract class OverviewRepo {
  Future<double> getRemainingBalance();
  Future<double> getLastWeekExpenses();
  Future<double> getExpensesInDay(DateTime date);

  Future<List<GoalModel>> getHomeGoals();
  Future<List<TransactionModel>> getHomeTransactions();
}
