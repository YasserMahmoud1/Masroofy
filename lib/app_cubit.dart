import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_states.dart';
import 'package:sqflite/sqflite.dart';

import 'consts.dart';
import 'goals_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'wallet_page.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  static AppCubit get(context) => BlocProvider.of(context);
  int currentPageIndex = 0;
  String addNewValue = "";
  int? labelID;
  String labelTitle = "";
  int? categoryID;
  String categoryTitle = "";
  late Database database;
  String incomOptions = "All";
  String todayOptions = "Today";
  List<Widget> screens = [
    const HomePage(),
    const WalletPage(),
    GoalsPage(),
    const SettingsPage(),
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

  List<Map<String, dynamic>> goals = [];
  List<Map<String, dynamic>> homeGoals = [];
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
  int selectedColor = 0;
  int selectedIcon = 0;
  DateTime lastWeek = DateTime.now().add(const Duration(days: -7));
  DateTime lastMonth = DateTime.now().add(const Duration(days: -30));
  var optionSpends = daySpends;
  void changeTodayOption(String value) {
    todayOptions = value;
    if (value == "This Week") {
      showLastWeekSpends(database);
      optionSpends = weekSpends;
      emit(TodayOptionChanged());
    } else if (value == "This Month") {
      showLastMonthSpends(database);
      optionSpends = monthSpends;
      emit(TodayOptionChanged());
    } else {
      showLastDaySpends(database);
      optionSpends = daySpends;
      emit(TodayOptionChanged());
    }

    emit(TodayOptionChanged());
  }

  void changeIncomeOption(String value) {
    incomOptions = value;
    if (value == "Expenses only") {
      showExpenseTransactions(database);
    } else if (value == "Income only") {
      showIncomeTransactions(database);
    } else {
      showTransactions(database);
    }
    emit(IncomeOptionChanged());
  }

  void changeNavBarPage(int value) {
    currentPageIndex = value;
    emit(ChangeNavBarPage());
  }

  void changeCategoryID(int id, String s) {
    categoryTitle = s;
    categoryID = id;
    labelID = null;
    emit(ChangeID());
  }

  void changeLabelID(int id, String s) {
    labelTitle = s;
    labelID = id;
    emit(ChangeID());
  }

  void updateAddNewValue(String value) {
    addNewValue += value;
    emit(UpdateAddNewValue());
  }

  void deleteAddNewValue() {
    if (addNewValue.isNotEmpty) {
      addNewValue = addNewValue.substring(0, addNewValue.length - 1);
    }
    emit(DeleteAddNewValue());
  }

  void clearAddNewValue() {
    addNewValue = "";
    emit(ClearAddNewValue());
  }

  void changeColor(int i) {
    selectedColor = i;
    emit(ChangeColor());
  }

  void changeIcon(int i) {
    selectedIcon = i;
    emit(ChangeIcon());
  }

  void createDatabase() async {
    openDatabase(
      'masroofy.db',
      version: 1,
      onCreate: (database, version) async {
        print('database created');
        await database.execute(
          'CREATE TABLE goals (id INTEGER PRIMARY KEY, title TEXT, is_done BOOLEAN, amount REAL)',
        );
        await database.execute(
            'CREATE TABLE labels (id INTEGER PRIMARY KEY, title TEXT, category_id INTEGER)');
        await database.execute(
            'CREATE TABLE categories (id INTEGER PRIMARY KEY,title TEXT, color TEXT, icon INTEGER)');
        await database.execute(
            'CREATE TABLE transactions (id INTEGER PRIMARY KEY, label TEXT, category_id INTEGER, day INTEGER, month INTEGER, year INTEGER, amount NUMERIC, is_income BOOLEAN)');
      },
      onOpen: (database) {
        showGoals(database);
        showCategories(database);
        showLabels(database);
        showTransactions(database);
        showHomeTransactions(database);
        showIncome(database);
                showLastDaySpends(database);
        showSpent(database);
        showHomeGoals(database);
        showLastWeekSpends(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(DatabaseOpened());
    });
  }

  void insertGoal({
    required String title,
    required double amount,
  }) async {
    await database
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO goals (title, is_done, amount) VALUES ("$title", 0, $amount )'))
        .then((value) {
      showGoals(database);
      showHomeGoals(database);
      emit(GoalsInserted());
      print('$value added to goals');
    });
  }

  void insertLabel({
    required String title,
    required int categoryID,
  }) async {
    await database
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO labels (title, category_id) VALUES ("$title", $categoryID)'))
        .then((value) {
      showLabels(database);
      emit(LabelInserted());
      print('$value added to database');
    });
  }

  void insertCategory({
    required String title,
    required int icon,
    required String color,
  }) async {
    await database
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO categories (title, color, icon) VALUES ("$title", "$color", $icon)'))
        .then((value) {
      showCategories(database);
      print('$value added to database');
      emit(CategoriesInserted());
    });
  }

  void insertTransaction({
    required String label,
    required int categoryID,
    required double amount,
    required bool isIncome,
  }) async {
    await database
        .transaction((txn) => txn.rawInsert(
            'INSERT INTO transactions (label, category_id, day, month, year, amount, is_income) VALUES ("$label", $categoryID, ${DateTime.now().day},${DateTime.now().month},${DateTime.now().year}, $amount, $isIncome )'))
        .then((value) {
      showTransactions(database);
      showHomeTransactions(database);
      showLastWeekSpends(database);
      showLastDaySpends(database);
      emit(TransactionInserted());
      print('$value added to database');
    });
  }

  void showGoals(database) {
    database.rawQuery('SELECT * From goals').then((value) {
      goals = value;
    });
    emit(GoalsShowed());
  }

  void showHomeGoals(database) {
    database
        .rawQuery(
            'SELECT title, amount From goals WHERE is_done = 0 ORDER BY(amount) DESC LIMIT 3')
        .then((value) {
      homeGoals = value;
    });
    emit(GoalsShowed());
  }

  void showLabels(database) {
    database.rawQuery('SELECT * From labels').then((value) {
      labels = value;
    });
    emit(LabelShowed());
  }

  void showCategories(database) {
    database.rawQuery('SELECT * From categories').then((value) {
      categories = value;
      emit(CategoriesShowed());
    });
  }

  void showTransactions(database) {
    database
        .rawQuery(
            'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) ORDER BY(id) DESC')
        .then((value) {
      transactions = value;
      emit(TransactionShowed());
    });
  }

  void showHomeTransactions(database) {
    database
        .rawQuery(
            'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) ORDER BY(id) DESC LIMIT 3')
        .then((value) {
      homeTransactions = value;
      emit(TransactionShowed());
    });
  }

  void showIncomeTransactions(database) {
    database
        .rawQuery(
            'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) WHERE is_income = 1 ORDER BY(id) DESC')
        .then((value) {
      transactions = value;
      emit(TransactionShowed());
    });
  }

  void showExpenseTransactions(database) {
    database
        .rawQuery(
            'SELECT transactions.*, categories.color, categories.icon ,categories.title FROM transactions  JOIN categories on (category_id = categories.id) WHERE is_income = 0 ORDER BY(id) DESC')
        .then((value) {
      transactions = value;
      emit(TransactionShowed());
    });
  }

  void showSpent(database) {
    database
        .rawQuery(
            'SELECT SUM(amount) as spends FROM transactions WHERE is_income = 0')
        .then((value) {
      spends = value[0]["spends"];
      emit(TransactionShowed());
    });
  }

  void showIncome(database) {
    database
        .rawQuery(
            'SELECT SUM(amount) as income FROM transactions WHERE is_income = 1')
        .then((value) {
      income = value[0]["income"];
      emit(TransactionShowed());
    });
  }

  void showLastMonthSpends(database) {
    database
        .rawQuery(
            'SELECT SUM(amount) as spends FROM transactions  WHERE day >= ${lastMonth.day} and month >= ${lastMonth.month} and year >= ${lastMonth.year} and is_income = 0')
        .then((value) {
      monthSpends = value[0]["spends"];
      emit(TransactionShowed());
    });
  }

  void showLastWeekSpends(database) {
    database
        .rawQuery(
            'SELECT SUM(amount) as spends FROM transactions  WHERE day >= ${lastWeek.day} and month >= ${lastWeek.month} and year >= ${lastWeek.year} and is_income = 0')
        .then((value) {
      weekSpends = value[0]["spends"];
      emit(TransactionShowed());
    });
  }

  void showLastDaySpends(database) {
    database
        .rawQuery(
            'SELECT SUM(amount) as spends FROM transactions  WHERE day >= ${DateTime.now().day} and month >= ${DateTime.now().month} and year >= ${DateTime.now().year} and is_income = 0')
        .then((value) {
      daySpends = value[0]["spends"];
      emit(TransactionShowed());
    });
  }

  void updateGoal({required int id, required int isDone}) {
    database.rawUpdate('UPDATE goals SET is_Done = ? Where id = ? ',
        [isDone, id]).then((value) {
      showGoals(database);
      emit(GoalsUpdated());
    });
  }

  void updateCategory(
      {required int id,
      required int icon,
      required String color,
      required String title}) {
    database.rawUpdate(
        'UPDATE categories SET title = ?, color = ?, icon = ? Where id = ? ',
        [title, color, icon, id]).then((value) {
      emit(CategoriesUpdated());
      showGoals(database);
    });
  }
}
