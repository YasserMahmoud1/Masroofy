import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_states.dart';

import 'goals_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'wallet_page.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  int currentPageIndex = 0;
  String addNewValue = "";
  List<Widget> screens = [
    const HomePage(),
    WalletPage(),
    const GoalsPage(),
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
  List labels = [
    "Breakfast",
  ];
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

  void changeDarkMode(bool value) {
    isDark = value;
    emit(DarkModeChange());
  }

  void changeNavBarPage(int value) {
    currentPageIndex = value;
    emit(ChangeNavBarPage());
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
}
