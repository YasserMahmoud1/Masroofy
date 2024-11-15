class GoalModel {
  final String title;
  final bool isDone;
  final double amount;
  final int id;

  GoalModel(this.title, this.isDone, this.amount, this.id);

  GoalModel.fromJSON(Map<String, dynamic> json)
      : title = json['title'],
        isDone = json['is_done'] == 1,
        amount = json['amount'],
        id = json['id'];
}
