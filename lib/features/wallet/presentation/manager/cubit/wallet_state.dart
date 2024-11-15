part of 'wallet_cubit.dart';

@immutable
class WalletState {}

class WalletInitial extends WalletState {}
class WalletChangeDropdown extends WalletState {}
class WalletSuccess extends WalletState {
  final List<TransactionModel> transactions;
  final double spent;
  WalletSuccess(this.transactions, this.spent);
}
class WalletLoading extends WalletState {}