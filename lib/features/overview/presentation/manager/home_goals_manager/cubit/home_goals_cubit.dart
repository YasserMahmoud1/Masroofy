import 'package:bloc/bloc.dart';

// import '../../../../../../core/utils/service_locator.dart';
import '../../../../../goals/data/model/goals_models.dart';
import '../../../../data/repos/overview_repo_impl.dart';

part 'home_goals_state.dart';

class HomeGoalsCubit extends Cubit<HomeGoalsState> {
  HomeGoalsCubit(this._overviewRepoImpl) : super(HomeGoalsInitial());
  
  // HomeGoalsCubit._(this._overviewRepoImpl) : super(HomeGoalsInitial());
  // static final HomeGoalsCubit _internal = HomeGoalsCubit._(getIt.get<OverviewRepoImpl>());
  // factory HomeGoalsCubit() => _internal;

  final OverviewRepoImpl _overviewRepoImpl;

  Future<void> getGoals() async {
    emit(HomeGoalsLoading());
    final goals = await _overviewRepoImpl.getHomeGoals();
    emit(HomeGoalsSuccess(goals));
  }
}
