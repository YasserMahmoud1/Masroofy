import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:masroofy/consts.dart';
import 'package:masroofy/core/utils/service_locator.dart';
import 'package:masroofy/features/wallet/presentation/manager/cubit/wallet_cubit.dart';

import '../../../../components.dart';
import '../../data/repos/wallet_repo_impl.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WalletCubit(getIt.get<WalletRepoImpl>())..getTransactions(),
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                WalletPeriodDropdown(),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "you spent",
                  style: TextStyle(fontSize: 16),
                ),
              ]),
              SizedBox(
                height: 8,
              ),
              WalletSpent(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "so far",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 20,
                      child: WalletTypeDropdown(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              WalletList(),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletList extends StatelessWidget {
  const WalletList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(child: Text("No transactions made"));
          } else {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.transactions.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (BuildContext context, int index) {
                return transactionTile(state.transactions[index]);
              },
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class WalletSpent extends StatelessWidget {
  const WalletSpent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletSuccess) {
          return Text(
            "${state.spent} EGP",
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class WalletTypeDropdown extends StatelessWidget {
  const WalletTypeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return DropdownButton<String>(
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(
              value: "All",
              child: Text("All"),
            ),
            DropdownMenuItem(
              value: "Expenses only",
              child: Text("Expenses only"),
            ),
            DropdownMenuItem(
              value: "Income only",
              child: Text("Income only"),
            )
          ],
          onChanged: (value) {
            WalletCubit.get(context).changeTypeDropdown(value!);
          },
          value: WalletCubit.get(context).type,
        );
      },
    );
  }
}

class WalletPeriodDropdown extends StatelessWidget {
  const WalletPeriodDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return Container(
          height: 30,
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DropdownButton<int>(
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text("Today"),
              ),
              DropdownMenuItem(
                value: 7,
                child: Text("This Week"),
              ),
              DropdownMenuItem(
                value: 30,
                child: Text("This Month"),
              )
            ],
            onChanged: (value) {
              WalletCubit.get(context).changeTimeDropdown(value!);
            },
            value: WalletCubit.get(context).time,
          ),
        );
      },
    );
  }
}
