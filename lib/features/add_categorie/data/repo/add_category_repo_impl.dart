import 'package:masroofy/features/categories/data/models/categories_model.dart';

import '../../../../core/utils/database_service.dart';
import 'add_category_repo.dart';

class AddCategoryRepoImpl implements AddCategoryRepo {
  final DatabaseService databaseService;

  AddCategoryRepoImpl(this.databaseService);
  @override
  Future<void> addCategory(CategoriesModel category) async {
    final db = await databaseService.db;
    db.rawInsert("""
      INSERT INTO categories (title, color, icon, is_income_category) VALUES("${category.title}","${category.color}",${category.icon},${category.isIncome! ? 1 : 0})
    """);
  }

  @override
  Future<void> updateCategory(CategoriesModel category) async {
    final db = await databaseService.db;
    db.rawUpdate("""
      UPDATE categories
      SET color="${category.color}", icon=${category.icon}, title="${category.title}"
      WHERE id=${category.id}
    """);
  }
}
