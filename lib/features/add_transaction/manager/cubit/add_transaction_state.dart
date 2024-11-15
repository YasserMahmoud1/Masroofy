part of 'add_transaction_cubit.dart';

class AddTransactionState {}
class AddTransactionInitial extends AddTransactionState {}
class ChangeID extends AddTransactionState {}
class ClearAddNewValue extends AddTransactionState {}
class DeleteAddNewValue extends AddTransactionState {}

class UpdateAddNewValue extends AddTransactionState {}
class TransactionInserted extends AddTransactionState {}

class TransactionGetCategoriesLoading extends AddTransactionState {}

class TransactionGetCategoriesSuccess extends AddTransactionState {
  final List<CategoriesModel> categories;
  TransactionGetCategoriesSuccess(this.categories);
}