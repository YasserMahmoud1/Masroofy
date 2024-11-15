import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/consts.dart';

import '../manager/home_manager/cubit/home_cubit.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: HomeCubit.get(context).screens[HomeCubit.get(context).currentPageIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: HomeCubit.get(context).currentPageIndex,
                onTap: (value) {
                  HomeCubit.get(context).changeNavBarPage(value);
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
        },
      ),
    );
  }
}
