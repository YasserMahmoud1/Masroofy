import '../../../categories/data/models/categories_model.dart';

abstract class AddCategoryRepo {
  Future<void> addCategory(CategoriesModel params);
  Future<void> updateCategory(CategoriesModel params);
}