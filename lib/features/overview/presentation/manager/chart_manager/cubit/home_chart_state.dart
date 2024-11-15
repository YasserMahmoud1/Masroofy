part of 'home_chart_cubit.dart';

@immutable
class HomeChartState {}

class HomeChartInitial extends HomeChartState {}
class HomeChartLoading extends HomeChartState {}
class HomeChartSuccess extends HomeChartState {
  final Map<int, double> chartData;
  HomeChartSuccess(this.chartData);
}