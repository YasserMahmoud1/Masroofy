part of 'goal_cubit.dart';

@immutable
class GoalState {}

class GoalInitial extends GoalState {}

class GoalSuccess extends GoalState {
  final List<GoalModel> unDoneGoals;
  final List<GoalModel> doneGoals;

  GoalSuccess({required this.unDoneGoals, required this.doneGoals});
}

class GoalLoading extends GoalState {}

class GoalChecked extends GoalState {}

class GoalInserted extends GoalState {}

class GoalDeleted extends GoalState {}
