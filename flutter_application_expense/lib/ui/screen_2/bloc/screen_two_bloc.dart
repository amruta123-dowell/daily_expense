import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'screen_two_event.dart';
part 'screen_two_state.dart';

class ScreenTwoBloc extends Bloc<ScreenTwoEvent, ScreenTwoState> {
  ScreenTwoBloc() : super(ScreenTwoState()) {
    on<ScreenTwoEvent>((event, emit) {
      emit(state.copyWith(text: "abcdefgh"));
    });
    on<OnclickButton2Event>(_onclickButton2);
  }

  FutureOr<void> _onclickButton2(
      OnclickButton2Event event, Emitter<ScreenTwoState> emit) {
    emit(state.copyWith(text: "abcdefghijklmnop"));
  }
}
