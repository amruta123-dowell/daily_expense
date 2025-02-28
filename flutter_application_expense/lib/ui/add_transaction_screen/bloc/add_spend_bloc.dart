import 'dart:async';

import 'package:bloc/bloc.dart';

import 'add_spend_event.dart';
import 'add_spend_state.dart';

class AddSpendBloc extends Bloc<AddSpendEvent, AddSpendState> {
  // final HomeWidgetBloc homeBloc;
  AddSpendBloc() : super(AddSpendState()) {
    on<AddSpendInitialEvent>(_initialize);
    on<OnSelectSpendCatEvent>(_onSelectedCat);
  }

  FutureOr<void> _initialize(
      AddSpendInitialEvent event, Emitter<AddSpendState> emit) {
    if (event.selectedTransactionType != null) {
      emit(state.copyWith(
          selectedTransactionType: event.selectedTransactionType,
          isTransactionType: true));
    } else {
      emit(state.copyWith(selectedCat: event.selectedCat));
    }
  }

  FutureOr<void> _onSelectedCat(
      OnSelectSpendCatEvent event, Emitter<AddSpendState> emit) {
    emit(state.copyWith(selectedCat: event.selectedCatType));
  }
}
