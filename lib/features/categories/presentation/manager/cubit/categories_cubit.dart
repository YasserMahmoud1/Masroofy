import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/features/categories/data/models/categories_model.dart';
import 'package:masroofy/features/categories/data/repos/categories_repo.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.categoriesRepo) : super(CategoriesInitial());

  static CategoriesCubit get(context) => BlocProvider.of(context);
  final CategoriesRepo categoriesRepo;

  void getCategories() async {
    emit(CategoriesLoading());
    final incomeCategories = await categoriesRepo.getCategories(true);
    final exepenseCategories = await categoriesRepo.getCategories(false);
    emit(CategoriesSuccess(incomeCategories, exepenseCategories));
  }
}
