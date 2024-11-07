import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<CalculatorInitialEvent>(_initialize);
    on<OnChangeAmountEvent>(_onSelectedAmt);
  }

  FutureOr<void> _initialize(
      CalculatorInitialEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(currentValue: 0));
  }

  FutureOr<void> _onSelectedAmt(
      OnChangeAmountEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(currentValue: event.amount));
    state.currentValue;
  }
}
