part of 'home_goals_cubit.dart';

class HomeGoalsState {}

class HomeGoalsInitial extends HomeGoalsState {}

class HomeGoalsLoading extends HomeGoalsState {}

class HomeGoalsSuccess extends HomeGoalsState {
  final List<GoalModel> goals;
  HomeGoalsSuccess(this.goals);
}
