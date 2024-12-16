import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/ui/screen_2/bloc/screen_two_bloc.dart';
import 'package:meta/meta.dart';

part 'screen_one_event.dart';
part 'screen_one_state.dart';

class ScreenOneBloc extends Bloc<ScreenOneEvent, ScreenOneState> {
  ScreenOneBloc() : super(ScreenOneState()) {
    on<ScreenOneEvent>((event, emit) {});
    on<ChangeDisableEVent>(_changeDisabeState);
  }

  FutureOr<void> _changeDisabeState(
      ChangeDisableEVent event, Emitter<ScreenOneState> emit) {
    emit(state.copyWith(disable: !(state.disable ?? false)));
  }
}
