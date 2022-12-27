

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

  List<DateTime> days = [
    DateTime.now().add(const Duration(days: -9)),
    DateTime.now().add(const Duration(days: -8)),
    DateTime.now().add(const Duration(days: -7)),
    DateTime.now().add(const Duration(days: -6)),
    DateTime.now().add(const Duration(days: -5)),
    DateTime.now().add(const Duration(days: -4)),
    DateTime.now().add(const Duration(days: -3)),
    DateTime.now().add(const Duration(days: -2)),
    DateTime.now().add(const Duration(days: -1)),
    DateTime.now(),
  ];
  List daysSpent = [0,0,0,0,0,0,0,0,0,0];
