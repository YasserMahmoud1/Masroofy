import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masroofy/features/wallet/data/repos/wallet_repo.dart';

import '../../../data/models/transaction_model.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this.walletRepo) : super(WalletInitial());

  static WalletCubit get(context) => BlocProvider.of(context);
  final WalletRepo walletRepo;
  String type = "All";
  int time = 0;
  void changeTypeDropdown(String dropdownValue) {
    type = dropdownValue;
    emit(WalletChangeDropdown());
    getTransactions();
  }

  void changeTimeDropdown(int dropdownValue) {
    time = dropdownValue;
    emit(WalletChangeDropdown());
    getTransactions();
  }

  void getTransactions() async {
    emit(WalletLoading());
    final response = await walletRepo.getTransactionsAndSpent(type, time);
    print(response[0][0].isIncome);
    emit(WalletSuccess(response[0], response[1]));
  }
}
