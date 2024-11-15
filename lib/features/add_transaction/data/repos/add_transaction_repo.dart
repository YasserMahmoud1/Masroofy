import '../../../categories/data/models/categories_model.dart';
import '../../../wallet/data/models/transaction_model.dart';

abstract class AddTransactionRepo{
  Future<List<CategoriesModel>> getCategories(bool isIncome);
  Future<void> insertTransaction(TransactionModel transaction);
}