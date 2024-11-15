import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/overview_repo_impl.dart';

part 'home_last_week_expenses_state.dart';

class HomeLastWeekExpensesCubit extends Cubit<HomeLastWeekExpensesState> {
  HomeLastWeekExpensesCubit(this._overviewRepoImpl)
      : super(HomeLastWeekExpensesInitial());


  final OverviewRepoImpl _overviewRepoImpl;

  Future<void> getLastWeekExpenses() async {
    emit(HomeLastWeekExpensesLoading());
    final expenses = await _overviewRepoImpl.getLastWeekExpenses();
    emit(HomeLastWeekExpensesSuccess(expenses));
  }
}
