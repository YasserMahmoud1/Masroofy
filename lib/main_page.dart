import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/app_cubit.dart';
import 'package:masroofy/app_states.dart';
import 'package:masroofy/consts.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialState()),
      child: BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);

            return SafeArea(
              child: Scaffold(
                body: cubit.screens[cubit.currentPageIndex],
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color.fromARGB(255, 218, 218, 218),
                  currentIndex: cubit.currentPageIndex,
                  onTap: (value) {
                    cubit.changeNavBarPage(value);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined),
                      label: "Home",
                      backgroundColor: primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.account_balance_wallet_outlined),
                      label: "Wallet",
                      backgroundColor: primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.checklist_rounded),
                      label: "Goals",
                      backgroundColor: primaryColor,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.settings_outlined),
                      label: "Settings",
                      backgroundColor: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
