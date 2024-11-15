// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:masroofy/app_states.dart';
// import 'package:sqflite/sqflite.dart';

// import 'consts.dart';
// import 'features/goales/presentation/view/goals_page.dart';
// import 'features/overview/presentation/view/home_page.dart';
// import 'features/settings/view/settings_page.dart';
// import 'features/wallet/presentation/view/wallet_page.dart';

// class AppCubit extends Cubit<AppStates> {
//   AppCubit(super.initialState);
//   static AppCubit get(context) => BlocProvider.of(context);

//   // int currentPageIndex = 0;

//   String addNewValue = "";
//   // int? labelID;
//   // String labelTitle = "";
//   int? categoryID;
//   String categoryTitle = "";
//   // late Database database;
//   // String incomOptions = "All";
//   // String todayOptions = "Today";
//   // List<Widget> screens = [
//   //   const HomePage(),
//   //   const WalletPage(),
//   //   GoalsPage(),
//   //   const SettingsPage(),
//   // ];



//   int selectedColor = 0;
//   int selectedIcon = 0;
//   DateTime lastWeek = DateTime.now().add(const Duration(days: -7));
//   DateTime lastMonth = DateTime.now().add(const Duration(days: -30));
//   var optionSpends = daySpends;

//   // void changeNavBarPage(int value) {
//   //   currentPageIndex = value;
//   //   emit(ChangeNavBarPage());
//   // }

//   void changeCategoryID(int id, String s) {
//     categoryTitle = s;
//     categoryID = id;
//     // labelID = null;
//     emit(ChangeID());
//   }

//   // void changeLabelID(int id, String s) {
//   //   labelTitle = s;
//   //   labelID = id;
//   //   emit(ChangeID());
//   // }

//   void updateAddNewValue(String value) {
//     addNewValue += value;
//     emit(UpdateAddNewValue());
//   }

//   void deleteAddNewValue() {
//     if (addNewValue.isNotEmpty) {
//       addNewValue = addNewValue.substring(0, addNewValue.length - 1);
//     }
//     emit(DeleteAddNewValue());
//   }

//   void clearAddNewValue() {
//     addNewValue = "";
//     emit(ClearAddNewValue());
//   }

//   void changeColor(int i) {
//     selectedColor = i;
//     emit(ChangeColor());
//   }

//   void changeIcon(int i) {
//     selectedIcon = i;
//     emit(ChangeIcon());
//   }

//   // void createDatabase() async {
//   //   openDatabase(
//   //     'masroofy.db',
//   //     version: 1,
//   //     onCreate: (database, version) async {
//   //       print('database created');
//   //       await database.execute(
//   //         'CREATE TABLE goals (id INTEGER PRIMARY KEY, title TEXT, is_done BOOLEAN, amount REAL)',
//   //       );
//   //       await database.execute(
//   //           'CREATE TABLE labels (id INTEGER PRIMARY KEY, title TEXT, category_id INTEGER)');
//   //       await database.execute(
//   //           'CREATE TABLE categories (id INTEGER PRIMARY KEY,title TEXT, color TEXT, icon INTEGER)');
//   //       await database.execute(
//   //           'CREATE TABLE transactions (id INTEGER PRIMARY KEY, label TEXT, category_id INTEGER, day INTEGER, month INTEGER, year INTEGER, amount NUMERIC, is_income BOOLEAN)');
//   //     },
//   //     onOpen: (database) {
//   //       showDaysSpends(database);
//   //       showGoals(database);
//   //       showCategories(database);
//   //       showLabels(database);
//   //       showTransactions(database);
//   //       showHomeTransactions(database);
//   //       showIncome(database);
//   //       showLastDaySpends(database);
//   //       showSpent(database);
//   //       showHomeGoals(database);
//   //       showLastWeekSpends(database);
//   //       print('database opened');
//   //     },
//   //   ).then((value) {
//   //     database = value;
//   //     emit(DatabaseOpened());
//   //   });
//   // }

//   // void changeIncomeOption(String value) {
//   //   incomOptions = value;
//   //   if (value == "Expenses only") {
//   //     showExpenseTransactions(database);
//   //   } else if (value == "Income only") {
//   //     showIncomeTransactions(database);
//   //   } else {
//   //     showTransactions(database);
//   //   }
//   //   emit(IncomeOptionChanged());
//   // }

//   // void changeTodayOption(String value) {
//   //   todayOptions = value;
//   //   if (value == "This Week") {
//   //     showLastWeekSpends(database);
//   //     optionSpends = weekSpends;
//   //     emit(TodayOptionChanged());
//   //   } else if (value == "This Month") {
//   //     showLastMonthSpends(database);
//   //     optionSpends = monthSpends;
//   //     emit(TodayOptionChanged());
//   //   } else {
//   //     showLastDaySpends(database);
//   //     optionSpends = daySpends;
//   //     emit(TodayOptionChanged());
//   //   }

//   //   emit(TodayOptionChanged());
//   // }

//   // void insertGoal({
//   //   required String title,
//   //   required double amount,
//   // }) async {
//   //   await database
//   //       .transaction((txn) => txn.rawInsert(
//   //           'INSERT INTO goals (title, is_done, amount) VALUES ("$title", 0, $amount )'))
//   //       .then((value) {
//   //     showGoals(database);
//   //     showHomeGoals(database);
//   //     emit(GoalsInserted());
//   //     print('$value added to goals');
//   //   });
//   // }

//   // void insertLabel({
//   //   required String title,
//   //   required int categoryID,
//   // }) async {
//   //   await database
//   //       .transaction((txn) => txn.rawInsert(
//   //           'INSERT INTO labels (title, category_id) VALUES ("$title", $categoryID)'))
//   //       .then((value) {
//   //     showLabels(database);
//   //     emit(LabelInserted());
//   //     print('$value added to database');
//   //   });
//   // }

//   void insertCategory({
//     required String title,
//     required int icon,
//     required String color,
//   }) async {
//     await database
//         .transaction((txn) => txn.rawInsert(
//             'INSERT INTO categories (title, color, icon) VALUES ("$title", "$color", $icon)'))
//         .then((value) {
//       showCategories(database);
//       print('$value added to database');
//       emit(CategoriesInserted());
//     });
//   }

//   void insertTransaction({
//     required String label,
//     required int categoryID,
//     required double amount,
//     required bool isIncome,
//   }) async {
//     await database
//         .transaction((txn) => txn.rawInsert(
//             'INSERT INTO transactions (label, category_id, day, month, year, amount, is_income) VALUES ("$label", $categoryID, ${DateTime.now().day},${DateTime.now().month},${DateTime.now().year}, $amount, $isIncome )'))
//         .then((value) {
//       emit(TransactionInserted());
//       showHomeTransactions(database);
//       showTransactions(database);
//       showLastWeekSpends(database);
//       showLastDaySpends(database);
//       showDaysSpends(database);
//       showLastDaySpends(database);
//       emit(TransactionInserted());
//       print('$value added to database');
//     });
//   }

//   void showGoals(database) {
//     database.rawQuery('SELECT * From goals').then((value) {
//       goals = value;
//     });
//     emit(GoalsShowed());
//   }

//   void showHomeGoals(database) {
//     database
//         .rawQuery(
//             'SELECT title, amount From goals WHERE is_done = 0 ORDER BY(amount) DESC LIMIT 3')
//         .then((value) {
//       homeGoals = value;
//     });
//     emit(GoalsShowed());
//   }

//   void showLabels(database) {
//     database.rawQuery('SELECT * From labels').then((value) {
//       labels = value;
//     });
//     emit(LabelShowed());
//   }

//   void showCategories(database) {
//     database.rawQuery('SELECT * From categories').then((value) {
//       categories = value;
//       emit(CategoriesShowed());
//     });
//   }

//   void showTransactions(database) {
//     database
//         .rawQuery(
//             'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) ORDER BY(id) DESC')
//         .then((value) {
//       transactions = value;
//       emit(TransactionShowed());
//     });
//   }

//   void showHomeTransactions(database) {
//     database
//         .rawQuery(
//             'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) ORDER BY(id) DESC LIMIT 3')
//         .then((value) {
//       homeTransactions = value;
//       emit(TransactionShowed());
//     });
//   }

//   void showIncomeTransactions(database) {
//     database
//         .rawQuery(
//             'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) WHERE is_income = 1 ORDER BY(id) DESC')
//         .then((value) {
//       transactions = value;
//       emit(TransactionShowed());
//     });
//   }

//   void showExpenseTransactions(database) {
//     database
//         .rawQuery(
//             'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) WHERE is_income = 0 ORDER BY(id) DESC')
//         .then((value) {
//       transactions = value;
//       emit(TransactionShowed());
//     });
//   }

//   void showSpent(database) {
//     database
//         .rawQuery(
//             'SELECT SUM(amount) as spends FROM transactions WHERE is_income = 0')
//         .then((value) {
//       spends = value[0]["spends"]??0;
//       emit(TransactionShowed());
//     });
//   }

//   void showIncome(database) {
//     database
//         .rawQuery(
//             'SELECT SUM(amount) as income FROM transactions WHERE is_income = 1')
//         .then((value) {
//       income = value[0]["income"]??0;
//       emit(TransactionShowed());
//     });
//   }

//   void showLastMonthSpends(database) {
//     database
//         .rawQuery(
//             'SELECT SUM(amount) as spends FROM transactions  WHERE day >= ${lastMonth.day} and month >= ${lastMonth.month} and year >= ${lastMonth.year} and is_income = 0')
//         .then((value) {
//       monthSpends = value[0]["spends"];
//       emit(TransactionShowed());
//     });
//   }

//   void showLastWeekSpends(database) {
//     database
//         .rawQuery(
//             'SELECT SUM(amount) as spends FROM transactions  WHERE day >= ${lastWeek.day} and month >= ${lastWeek.month} and year >= ${lastWeek.year} and is_income = 0')
//         .then((value) {
//       weekSpends = value[0]["spends"]??0;
//       emit(TransactionShowed());
//     });
//   }

//   void showLastDaySpends(database) {
//     database
//         .rawQuery(
//             'SELECT SUM(amount) as spends FROM transactions  WHERE day = ${DateTime.now().day} and month = ${DateTime.now().month} and year = ${DateTime.now().year} and is_income = 0')
//         .then((value) {
//       daySpends = value[0]["spends"]??0;
//       emit(TransactionShowed());
//     });
//   }

//   void showDaysSpends(database) {
//     for (int i = 0; i < days.length; i++) {
//       database
//           .rawQuery(
//               'SELECT SUM(amount) as spends FROM transactions  WHERE day = ${days[i].day} and month = ${days[i].month} and year = ${days[i].year} and is_income = 0')
//           .then((value) {
//         daysSpent[i] = (value[0]["spends"]);
//         emit(TransactionShowed());
//       });
//       emit(TransactionShowed());
//     }
//     emit(TransactionShowed());
//   }

//   void updateGoal({required int id, required int isDone}) {
//     database.rawUpdate('UPDATE goals SET is_Done = ? Where id = ? ',
//         [isDone, id]).then((value) {
//       showGoals(database);
//       emit(GoalsUpdated());
//     });
//   }

//   void deleteTransaction({required int id}) {
//     database
//         .rawDelete('DELETE FROM transactions WHERE id = ?', [id]).then((value) {
//       showTransactions(database);
//       showHomeTransactions(database);
//       emit(TransactionsDeleted());
//     });
//   }

//   void updateCategory(
//       {required int id,
//       required int icon,
//       required String color,
//       required String title}) {
//     database.rawUpdate(
//         'UPDATE categories SET title = ?, color = ?, icon = ? Where id = ? ',
//         [title, color, icon, id]).then((value) {
//       emit(CategoriesUpdated());
//       showGoals(database);
//     });
//   }
// }
