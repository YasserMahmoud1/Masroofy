import 'package:masroofy/features/wallet/data/models/transaction_model.dart';
import 'package:masroofy/features/wallet/data/repos/wallet_repo.dart';

import '../../../../core/utils/database_service.dart';

class WalletRepoImpl implements WalletRepo {
  final DatabaseService databeseService;

  WalletRepoImpl(this.databeseService);

  @override
  Future<List<dynamic>> getTransactionsAndSpent(String type, int time) async {
    String query = """
      SELECT t.id, t.date, CAST(t.amount as DOUBLE) as amount, t.is_income_transaction, c.title as categorie_title, c.color, c.icon
      FROM transactions t
      LEFT JOIN categories c
      ON t.category_id = c.id
      WHERE DATE(date) <= DATE('now')
      AND DATE(date) >= DATE('now', '-$time days')

    """;
    if (type == "Expenses only") {
      query += "AND is_income_transaction=0";
    } else if (type == "Income only") {
      query += "AND is_income_transaction=1";
    }

    String query2 = """
      SELECT CAST(IFNULL(SUM(amount),0.0) as DOUBLE) as spent
      FROM transactions
      WHERE is_income_transaction=0
      AND DATE(date) <= DATE('now')
      AND DATE(date) >= DATE('now', '-$time days')
    """;
    final database = await databeseService.db;
    final response1 = await database.rawQuery(query);
    final response2 = await database.rawQuery(query2);


    return [
      response1
          .map<TransactionModel>((e) => TransactionModel.fromJSON(e))
          .toList(),
      response2[0]['spent'] as double,
    ];
  }
}
