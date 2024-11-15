import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../goals/presentation/view/goals_page.dart';
import '../../../../../overview/presentation/view/home_page.dart';
import '../../../../../settings/view/settings_page.dart';
import '../../../../../wallet/presentation/view/wallet_page.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  List<Widget> screens = [
  const HomePage(),
  const WalletPage(),
  GoalsPage(),
  const SettingsPage(),
  ];

  void changeNavBarPage(int value) {
    currentPageIndex = value;
    emit(HomeChangeNavBarPage());
  }

}
