part of 'home_last_week_expenses_cubit.dart';

@immutable
class HomeLastWeekExpensesState {}

class HomeLastWeekExpensesInitial extends HomeLastWeekExpensesState {}
class HomeLastWeekExpensesLoading extends HomeLastWeekExpensesState {}
class HomeLastWeekExpensesSuccess extends HomeLastWeekExpensesState {
  final double expenses;
  HomeLastWeekExpensesSuccess(this.expenses);
}