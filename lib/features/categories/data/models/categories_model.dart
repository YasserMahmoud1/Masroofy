class CategoriesModel {
  int? id;
  String title;
  int icon;
  String color;
  bool? isIncome;

  CategoriesModel({this.id,required this.title, required this.icon, required this.color, this.isIncome});

  factory CategoriesModel.fromJSON(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["id"],
      title: json["title"],
      icon: json["icon"],
      color: json["color"],
      isIncome: json["is_income"] == 1 ? true : false,
    );
  }

  void changeColor(String value) {
    color = value;
  }

  void changeTitle(String value) {
    title = value;
  }

  void changeIconData(int value) {
    icon = value;
  }

  String getColor() => color;
}
