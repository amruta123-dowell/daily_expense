import 'dart:async';

import 'package:bloc/bloc.dart';


import 'package:flutter_application_expense/utils/month.dart';

import 'home_widget_event.dart';
import 'package:collection/collection.dart';

import 'home_widget_state.dart';

class HomewidgetBloc extends Bloc<HomewidgetEvent, HomewidgetState> {
  HomewidgetBloc() : super(HomewidgetState()) {
    on<InitialHomeWidgetEvent>(_initialize);
    on<OnselectedMonthEvent>(_onChangeMonth);
  }

  FutureOr<void> _initialize(
      InitialHomeWidgetEvent event, Emitter<HomewidgetState> emit) {
    Month initialMonth = state.listMonth
        .firstWhere((element) => element.id == DateTime.now().month);
    emit(state.copyWith(selectedMonth: initialMonth));
  }

  FutureOr<void> _onChangeMonth(
      OnselectedMonthEvent event, Emitter<HomewidgetState> emit) {
    emit(state.copyWith(selectedMonth: state.listMonth[event.selectedIndex]));
  }
}
