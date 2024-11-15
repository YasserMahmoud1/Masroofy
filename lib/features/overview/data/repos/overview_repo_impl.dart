import 'package:masroofy/features/goals/data/model/goals_models.dart';

import 'package:masroofy/features/wallet/data/models/transaction_model.dart';

import '../../../../core/utils/database_service.dart';
import 'overview_repo.dart';
import 'package:intl/intl.dart';

class OverviewRepoImpl implements OverviewRepo {
  OverviewRepoImpl(this.databaseService);
  final DatabaseService databaseService;

  @override
  Future<double> getExpensesInDay(DateTime date) async {
    final database = await databaseService.db;
    final response = await database.rawQuery("""
      SELECT CAST(IFNULL(SUM(amount),0.0) as DOUBLE) as expense
      FROM transactions
      WHERE is_income_transaction=0
      AND DATE(date) = DATE('${DateFormat('yyyy-MM-dd').format(date)}')
    """);

    return response[0]['expense'] as double;
  }

  @override
  Future<double> getRemainingBalance() async {
    final database = await databaseService.db;
    final response = await database.rawQuery("""
      SELECT CAST(IFNULL(SUM(CASE WHEN is_income_transaction = TRUE THEN amount ELSE -amount END),0.0) AS DOUBLE) AS current_balance 
      FROM transactions

    """);
    return response[0]['current_balance'] as double;
  }

  @override
  Future<double> getLastWeekExpenses() async {
    final database = await databaseService.db;
    final response = await database.rawQuery("""
      SELECT CAST(IFNULL(SUM(amount),0.0) as DOUBLE) as expense
      FROM transactions
      WHERE is_income_transaction=0
      AND DATE(date) <= DATE("now")
      AND DATE(date) > DATE("now", "-7 days")
    """);
    return response[0]['expense'] as double;
  }

  @override
  Future<List<GoalModel>> getHomeGoals() async {
    final database = await databaseService.db;
    final response = await database.rawQuery("""
      SELECT * FROM goals 
      WHERE is_done = 0
      LIMIT 3
    """);

    return response.map((goal) => GoalModel.fromJSON(goal)).toList();
  }

  @override
  Future<List<TransactionModel>> getHomeTransactions() async {
    final database = await databaseService.db;
    final response = await database.rawQuery("""
      SELECT t.id, t.date, CAST(t.amount as DOUBLE) as amount, t.is_income_transaction, c.title as categorie_title, c.color, c.icon
      FROM transactions t
      LEFT JOIN categories c
      ON t.category_id = c.id
      ORDER BY t.id DESC
      LIMIT 3
    """);

    return response
        .map((transaction) => TransactionModel.fromJSON(transaction))
        .toList();
  }
}
