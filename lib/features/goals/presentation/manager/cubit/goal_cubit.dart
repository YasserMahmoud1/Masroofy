import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/goals_models.dart';
import '../../../data/repos/goal_repo.dart';

part 'goal_state.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit(this.goalRepo) : super(GoalInitial());

  static GoalCubit get(context) => BlocProvider.of(context);

  final GoalRepo goalRepo;

  void getGoals() async {
    emit(GoalLoading());
    final done = await goalRepo.getGoals(true);
    final unDone = await goalRepo.getGoals(false);
    emit(GoalSuccess(unDoneGoals: unDone, doneGoals: done));
  }

  void checkGoal(GoalModel goal) async {
    await goalRepo.checkGoal(goal);
    emit(GoalChecked());
    getGoals();
  }

  void insertGoal(String title, double amount) async {
    await goalRepo.insertGoal(title, amount);
    emit(GoalInserted());
    getGoals();
  }

  void deleteGoal(int goalId) async {
    await goalRepo.deleteGoal(goalId);
    emit(GoalDeleted());
    getGoals();
  }
}
