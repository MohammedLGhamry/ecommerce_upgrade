import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'indicator_dots_state.dart';

class IndicatorDotsCubit extends Cubit<IndicatorDotsState> {
  IndicatorDotsCubit() : super(IndicatorDotsInitial());

  int currentIndex = 0;
  List<bool> indicatorStatus = [];

  void ChangeIndicatorStatus(int index , List list) {
    currentIndex = index;
    indicatorStatus = List.generate(
        list.length, (i) => i == index);
    emit(IndicatorChangedSuccessfully(indicatorStatus));
  }
}
