import '../model/goals_models.dart';

abstract class GoalRepo {
  Future<List<GoalModel>> getGoals(bool isDone);
  Future<void> insertGoal(String title, double amount);
  Future<void> checkGoal(GoalModel goal);
  Future<void> deleteGoal(int goalID);
}
