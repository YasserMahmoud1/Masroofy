part of 'home_balance_cubit.dart';

class HomeBalanceState {}

class HomeBalanceInitial extends HomeBalanceState {}
class HomeBalanceLoading extends HomeBalanceState {}
class HomeBalanceSuccess extends HomeBalanceState {
  final double balance;
  HomeBalanceSuccess(this.balance);
}

