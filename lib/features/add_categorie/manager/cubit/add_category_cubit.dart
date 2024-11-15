import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/data/models/categories_model.dart';
import '../../data/repo/add_category_repo.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this.addCategoryRepo) : super(AddCategoryInitial());
  
  static AddCategoryCubit get(BuildContext context) =>
      BlocProvider.of<AddCategoryCubit>(context);
  
  final AddCategoryRepo addCategoryRepo;
  int selectedIcon = 0;
  int selectedColor = 0;

  changeColor(int index) {
    selectedColor = index;
    emit(AddCategoryChangeColor());
  }

  changeIcon(int index) {
    selectedIcon = index;
    emit(AddCategoryChangeIcon());
  }

  insertCategory(CategoriesModel category) async {
    await addCategoryRepo.addCategory(category);
    emit(AddCategoryInsert());
  }
  updateCategory(CategoriesModel category) async {
    await addCategoryRepo.updateCategory(category);
    emit(AddCategoryUpdate());
  }
}
