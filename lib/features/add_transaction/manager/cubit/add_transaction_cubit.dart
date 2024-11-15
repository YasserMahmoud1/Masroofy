
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/data/models/categories_model.dart';
import '../../../wallet/data/models/transaction_model.dart';
import '../../data/repos/add_transaction_repo.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit(this.addTransactionRepo) : super(AddTransactionInitial());
  static AddTransactionCubit get(context) => BlocProvider.of(context);
  final AddTransactionRepo addTransactionRepo;
  
  String addNewValue = "";
  
  CategoriesModel? selectedCategory;

  void changeCategory(CategoriesModel category) {
    selectedCategory = category;
    emit(ChangeID());
  }

  void clearAddNewValue() {
    addNewValue = "";
    emit(ClearAddNewValue());
  }

  void getCategories(bool isIncome) async {
    emit(TransactionGetCategoriesLoading());
    final categories = await addTransactionRepo.getCategories(isIncome);
    emit(TransactionGetCategoriesSuccess(categories));
  }

  void deleteAddNewValue() {
    if (addNewValue.isNotEmpty) {
      addNewValue = addNewValue.substring(0, addNewValue.length - 1);
    }
    emit(DeleteAddNewValue());
  }

  void updateAddNewValue(String value) {
    if (value == ".") {
      if (addNewValue.contains(".")) {
        return;
      }
    }
    addNewValue += value;
    emit(UpdateAddNewValue());
  }

  void insertTransaction(TransactionModel transaction) async {
    await addTransactionRepo.insertTransaction(transaction);
    emit(TransactionInserted());
  }
}
