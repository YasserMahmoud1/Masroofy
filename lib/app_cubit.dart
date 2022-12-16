import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_states.dart';

import 'goals_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'wallet_page.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  static AppCubit get(context)=> BlocProvider.of(context);
  bool isDark = false;
  int currentPageIndex = 0;
  List<Widget> screens = [
    HomePage(),
    WalletPage(),
    GoalsPage(),
    SettingsPage(),
  ];
  void changeDarkMode(bool value) {
    isDark = value;
    emit(DarkModeChange());
  }

  void changeNavBarPage(int value) {
    currentPageIndex = value;
    emit(ChangeNavBarPage());
  }
}
