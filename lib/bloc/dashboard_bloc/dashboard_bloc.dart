import 'package:bloc_search/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, int> {
  DashboardBloc() : super(0) {
    on<SetDashboardIndex>((event, emit) {
      emit(event.index);
    });
  }
}
