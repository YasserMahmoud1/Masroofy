class Category {
  String title;
  String color;
  int iconData;

  Category({required this.title, required this.color, required this.iconData});
  void changeColor(String value) {
    color = value;
  }
  void changeTitle(String value) {
    title = value;
  }
  void changeIconData(int value) {
    iconData = value;
  }
  String getColor() => color;

}
