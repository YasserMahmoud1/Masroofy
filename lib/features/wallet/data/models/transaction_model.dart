import '../../../categories/data/models/categories_model.dart';

class TransactionModel {
  int? id;
  final double amount;
  final CategoriesModel category;
  final bool isIncome;
  final DateTime date;

  TransactionModel({
    this.id,
    required this.date,
    required this.amount,
    required this.category,
    required this.isIncome,
  });

  factory TransactionModel.fromJSON(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      amount: json['amount'],
      category:CategoriesModel(color:json['color'],icon:json['icon'],title: json['categorie_title'],),
      isIncome: json['is_income'] == 1,
    );
  }
}
