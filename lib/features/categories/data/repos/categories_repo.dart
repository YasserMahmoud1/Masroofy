import '../models/categories_model.dart';

abstract class CategoriesRepo {
  Future<List<CategoriesModel>> getCategories(bool isIncome);
}