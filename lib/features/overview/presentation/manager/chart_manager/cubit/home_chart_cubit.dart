import 'package:bloc/bloc.dart';
// import 'package:masroofy/core/utils/service_locator.dart';
// import 'package:masroofy/features/overview/data/repos/overview_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../../data/repos/overview_repo.dart';

part 'home_chart_state.dart';

class HomeChartCubit extends Cubit<HomeChartState> {
  HomeChartCubit(this._overviewRepo) : super(HomeChartInitial());

  // HomeChartCubit._(this._overviewRepo) : super(HomeChartInitial());
  // static final HomeChartCubit _internal =
  //     HomeChartCubit._(getIt.get<OverviewRepoImpl>());
  // factory HomeChartCubit() => _internal;
  final OverviewRepo _overviewRepo;

  Future<void> getChartData() async {
    emit(HomeChartLoading());
    Map<int, double> chartData = {};
    for (int i = 6; i >= 0; i--) {
      final day = DateTime.now().add(Duration(days: -i));
      chartData[day.weekday] = await _overviewRepo.getExpensesInDay(day);
    }

    emit(HomeChartSuccess(chartData));
  }
}
