import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor("4681E2");
Color secondaryColor = HexColor("4681E2").withOpacity(.20);

List<Map<String, dynamic>> categories = [];
Map filterCategory(int i) {
  var cat;
  for (var element in categories) {
    if (element["category_id"] == i) {
      cat = element;
    }
  }
  return cat;
}

String searchForColor(int i) {
  String color = "ffffff";
  for (var element in categories) {
    if (element["id"] == i) {
      color = element["color"];
    }
  }
  return color;
}

List<String> clabels = [];
List<Map<String, dynamic>> labels = [];
void filterLabels(int i) {
  clabels = [];
  for (var element in labels) {
    if (element["category_id"] == i) {
      clabels.add(element["title"]);
    }
  }
}

List transactions = [];
var spends = 0;
var income = 0;
List homeTransactions = [];
var weekSpends = 0;
var monthSpends = 0;
var daySpends = 0;

