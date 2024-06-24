import 'package:bloc_search/bloc/calc_bloc/calc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcBloc extends Bloc<CalcEvent, int> {
  CalcBloc() : super(0) {
    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });
    on<DecrementEvent>((event, emit) {
      emit(state - 1);
    });
  }
}
