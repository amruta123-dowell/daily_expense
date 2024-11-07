import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/enums/bottom_nav_items.dart';

import 'bottom_nav_state.dart';
import 'bottom_nav_event.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {
    on<BottomNavInitialEvent>(_initialization);
    on<OnSelectBottomNavItemEvent>(_onSelectBottomItem);
  }

  FutureOr<void> _initialization(
      BottomNavInitialEvent event, Emitter<BottomNavState> emit) {
    emit(state.copyWith(bottomNavItem: 0));
  }

  FutureOr<void> _onSelectBottomItem(
      OnSelectBottomNavItemEvent event, Emitter<BottomNavState> emit) {
    emit(state.copyWith(bottomNavItem: event.selectedIndex));
  }
}
