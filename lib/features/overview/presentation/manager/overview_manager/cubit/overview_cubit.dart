import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../goals/data/model/goals_models.dart';
import '../../../../../wallet/data/models/transaction_model.dart';
import '../../../../data/repos/overview_repo_impl.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit(this._overviewRepoImpl) : super(OverviewInitial());
  static OverviewCubit get(context) => BlocProvider.of(context);
  final OverviewRepoImpl _overviewRepoImpl;
  Future<void> getData()async {
    emit(OverviewLoading());
    final balance = await _overviewRepoImpl.getRemainingBalance();
    Map<int, double> chartData = {};
    for (int i = 6; i >= 0; i--) {
      final day = DateTime.now().add(Duration(days: -i));
      chartData[day.weekday] = await _overviewRepoImpl.getExpensesInDay(day);
    }
    final goals = await _overviewRepoImpl.getHomeGoals();
    final transactions = await _overviewRepoImpl.getHomeTransactions();
    final expenses = await _overviewRepoImpl.getLastWeekExpenses();
    emit(OverviewSuccess(lastWeekExpenses: expenses, transactions: transactions, goals: goals, chartData: chartData, balance: balance));
  }
}
