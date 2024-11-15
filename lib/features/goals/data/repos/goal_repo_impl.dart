import 'package:masroofy/features/goals/data/model/goals_models.dart';

import '../../../../core/utils/database_service.dart';
import 'goal_repo.dart';

class GoalRepoImpl implements GoalRepo {
  final DatabaseService databaseService;

  GoalRepoImpl(this.databaseService);

  @override
  Future<void> checkGoal(GoalModel goal) async {
    final database = await databaseService.db;
    await database.rawInsert("""
      UPDATE goals
      SET is_done=${!goal.isDone}
      WHERE id=${goal.id}
    """);
  }

  @override
  Future<void> deleteGoal(int goalID) async {
    final database = await databaseService.db;
    await database.rawInsert("""
      DELETE FROM goals
      WHERE id=$goalID
    """);
  }

  @override
  Future<List<GoalModel>> getGoals(bool isDone) async {
    final database = await databaseService.db;
    final response = await database.rawQuery("""
      SELECT * 
      FROM goals
      WHERE is_done = ${isDone?1:0}
    """);
    return response.map<GoalModel>((goal) => GoalModel.fromJSON(goal)).toList();
  }

  @override
  Future<void> insertGoal(String title, double amount) async {
    final database = await databaseService.db;
    await database.rawInsert("""
      INSERT INTO goals(title,is_done,amount)
      VALUES("$title",0 ,$amount)
    """);
  }
}
