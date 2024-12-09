import 'package:intl/intl.dart';
import 'package:masroofy/core/utils/database_service.dart';
import 'package:masroofy/features/categories/data/models/categories_model.dart';
import 'package:masroofy/features/wallet/data/models/transaction_model.dart';

import 'add_transaction_repo.dart';

class AddTransactionRepoImpl implements AddTransactionRepo {
  final DatabaseService databaseService;

  AddTransactionRepoImpl(this.databaseService);
  @override
  Future<List<CategoriesModel>> getCategories(bool isIncome)async {
    final db = await databaseService.db;
    final response = await db.rawQuery("""
      SELECT * FROM categories
      WHERE is_income_category = ${isIncome ? 1 : 0}
    """);
    return response.map<CategoriesModel>((e) => CategoriesModel.fromJSON(e)).toList();

  }

  @override
  Future<void> insertTransaction(TransactionModel transaction)async {
    final db = await databaseService.db;
    await db.rawInsert("""
      INSERT INTO transactions (date,amount,category_id,is_income_transaction)
      VALUES (?,?,?,?)
    """, [
      DateFormat('yyyy-MM-dd').format(transaction.date),
      transaction.amount.toDouble(),
      transaction.category.id,
      transaction.isIncome ? 1 : 0,
    ]);
  }
}
