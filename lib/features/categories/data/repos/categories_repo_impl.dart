import 'package:masroofy/core/utils/database_service.dart';
import 'package:masroofy/features/categories/data/models/categories_model.dart';
import 'package:masroofy/features/categories/data/repos/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo{
  final DatabaseService databaseService;

  CategoriesRepoImpl(this.databaseService);

  @override
  Future<List<CategoriesModel>> getCategories(bool isIncome)async {
    final database = await databaseService.db;
    final categories = await database.rawQuery('SELECT * FROM categories WHERE is_income_category = $isIncome');
    return categories.map<CategoriesModel>((category) => CategoriesModel.fromJSON(category)).toList();
  }

}