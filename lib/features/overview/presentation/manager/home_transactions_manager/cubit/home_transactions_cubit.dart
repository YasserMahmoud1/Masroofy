import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// import '../../../../../../core/utils/service_locator.dart';
import '../../../../../wallet/data/models/transaction_model.dart';
import '../../../../data/repos/overview_repo_impl.dart';

part 'home_transactions_state.dart';

class HomeTransactionsCubit extends Cubit<HomeTransactionsState> {
  HomeTransactionsCubit(this._overviewRepoImpl) : super(HomeTransactionsInitial());

  // HomeTransactionsCubit._(this._overviewRepoImpl) : super(HomeTransactionsInitial());
  // static final HomeTransactionsCubit _internal = HomeTransactionsCubit._(getIt.get<OverviewRepoImpl>());
  // factory HomeTransactionsCubit() => _internal;


  final OverviewRepoImpl _overviewRepoImpl;

  Future<void> getTransactions() async {
    emit(HomeTransactionsLoading());
    final transactions = await _overviewRepoImpl.getHomeTransactions();
    emit(HomeTransactionsSuccess(transactions));
  }
}
