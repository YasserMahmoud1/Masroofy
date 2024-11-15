part of 'categories_cubit.dart';

@immutable
class CategoriesState {}
class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesSuccess extends CategoriesState {
  final List<CategoriesModel> incomeCategories;
  final List<CategoriesModel> expenseCategories;

  CategoriesSuccess(this.incomeCategories, this.expenseCategories);

}