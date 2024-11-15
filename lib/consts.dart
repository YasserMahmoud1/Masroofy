

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color primaryColor = HexColor("4681E2");
Color secondaryColor = HexColor("4681E2").withOpacity(.20);

// List<Map<String, dynamic>> categories = [];
// Map filterCategory(int i) {
//   var cat;
//   for (var element in categories) {
//     if (element["category_id"] == i) {
//       cat = element;
//     }
//   }
//   return cat;
// }

// String searchForColor(int i) {
//   String color = "ffffff";
//   for (var element in categories) {
//     if (element["id"] == i) {
//       color = element["color"];
//     }
//   }
//   return color;
// }

// List<String> clabels = [];
// List<Map<String, dynamic>> labels = [];
// void filterLabels(int i) {
//   clabels = [];
//   for (var element in labels) {
//     if (element["category_id"] == i) {
//       clabels.add(element["title"]);
//     }
//   }
// }

// List transactions = [];
// var spends = 0;
// var income = 0;
// List homeTransactions = [];
// var weekSpends = 0;
// var monthSpends = 0;
// var daySpends = 0;

//   List<DateTime> days = [
//     DateTime.now().add(const Duration(days: -9)),
//     DateTime.now().add(const Duration(days: -8)),
//     DateTime.now().add(const Duration(days: -7)),
//     DateTime.now().add(const Duration(days: -6)),
//     DateTime.now().add(const Duration(days: -5)),
//     DateTime.now().add(const Duration(days: -4)),
//     DateTime.now().add(const Duration(days: -3)),
//     DateTime.now().add(const Duration(days: -2)),
//     DateTime.now().add(const Duration(days: -1)),
//     DateTime.now(),
//   ];
//   List daysSpent = [0,0,0,0,0,0,0,0,0,0];
//   List<Map<String, dynamic>> goals = [];
  // List<Map<String, dynamic>> homeGoals = [];

List<int> icons = [
    (Icons.lunch_dining_outlined).codePoint,
    (Icons.card_giftcard_outlined).codePoint,
    (Icons.shopping_bag_outlined).codePoint,
    (Icons.sports_esports_outlined).codePoint,
    (Icons.sports_basketball_sharp).codePoint,
    (Icons.local_gas_station_outlined).codePoint,
    (Icons.directions_bus_outlined).codePoint,
    (Icons.checkroom_outlined).codePoint,
    (Icons.medical_services_outlined).codePoint,
    (Icons.bolt_outlined).codePoint,
    (Icons.auto_awesome_outlined).codePoint,
    (Icons.more_horiz_outlined).codePoint,
  ];
    List<String> colors = [
    "E5F486",
    "FFD9A0",
    "A0F9FF",
    "CCE5B8",
    "AEE6FF",
    "FED1B8",
    "FEF1AF",
    "FFACB6",
    "D3C3F4",
    "D7D7D7",
    "B8BFFF",
    "ECB5FF",
  ];