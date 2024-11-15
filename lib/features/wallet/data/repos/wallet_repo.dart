
abstract class WalletRepo {
  Future<List<dynamic>> getTransactionsAndSpent(String type, int time);
}
