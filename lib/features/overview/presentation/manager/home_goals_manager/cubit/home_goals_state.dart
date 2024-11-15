part of 'home_goals_cubit.dart';

@immutable
class HomeGoalsState {}

class HomeGoalsInitial extends HomeGoalsState {}

class HomeGoalsLoading extends HomeGoalsState {}

class HomeGoalsSuccess extends HomeGoalsState {
  final List<GoalModel> goals;
  HomeGoalsSuccess(this.goals);
}
