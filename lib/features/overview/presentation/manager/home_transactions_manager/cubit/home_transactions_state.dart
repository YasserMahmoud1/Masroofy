part of 'home_transactions_cubit.dart';

@immutable
class HomeTransactionsState {}

class HomeTransactionsInitial extends HomeTransactionsState {}
class HomeTransactionsLoading extends HomeTransactionsState {}
class HomeTransactionsSuccess extends HomeTransactionsState {
  final List<TransactionModel> transactions;
  HomeTransactionsSuccess(this.transactions);
}