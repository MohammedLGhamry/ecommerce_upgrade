part of 'indicator_dots_cubit.dart';

@immutable
abstract class IndicatorDotsState {}

class IndicatorDotsInitial extends IndicatorDotsState {
  List<bool> indicatorStatus = List.generate(10, (index) => index == 0);
}

class IndicatorChangedSuccessfully extends IndicatorDotsState {
  final List<bool> indicatorStatus;

  IndicatorChangedSuccessfully(this.indicatorStatus);
}