import 'package:bloc/bloc.dart';
// import 'package:masroofy/core/utils/service_locator.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/overview_repo_impl.dart';

part 'home_balance_state.dart';

class HomeBalanceCubit extends Cubit<HomeBalanceState> {
  HomeBalanceCubit(this._overviewRepoImpl) : super(HomeBalanceInitial());
  // HomeBalanceCubit._(this._overviewRepoImpl) : super(HomeBalanceInitial());
  // static final HomeBalanceCubit _internal = HomeBalanceCubit._(getIt.get<OverviewRepoImpl>());
  // factory HomeBalanceCubit() => _internal;
  final OverviewRepoImpl _overviewRepoImpl;

  Future<void> getBalance() async {
    emit(HomeBalanceLoading());
    final balance = await _overviewRepoImpl.getRemainingBalance();
    emit(HomeBalanceSuccess(balance));
  }
}
