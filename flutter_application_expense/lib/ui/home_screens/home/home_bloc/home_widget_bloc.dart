import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application_expense/utils/month.dart';

import 'home_widget_event.dart';

import 'home_widget_state.dart';

class HomeWidgetBloc extends Bloc<HomewidgetEvent, HomeWidgetState> {
  HomeWidgetBloc() : super(HomeWidgetState()) {
    on<InitialHomeWidgetEvent>(_initialize);
    on<OnselectedMonthEvent>(_onChangeMonth);
    on<CallSalaryAPIEvent>(_callSalaryAPIEvent);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FutureOr<void> _initialize(
      InitialHomeWidgetEvent event, Emitter<HomeWidgetState> emit) {
    Month initialMonth = state.listMonth
        .firstWhere((element) => element.id == DateTime.now().month);
    emit(state.copyWith(selectedMonth: initialMonth));
    add(CallSalaryAPIEvent());
  }

  FutureOr<void> _onChangeMonth(
      OnselectedMonthEvent event, Emitter<HomeWidgetState> emit) {
    emit(state.copyWith(selectedMonth: state.listMonth[event.selectedIndex]));
  }

  FutureOr<void> _callSalaryAPIEvent(
      CallSalaryAPIEvent event, Emitter<HomeWidgetState> emit) async {
    // Reference to the user's document in the "users" collection
    User? user = _auth.currentUser;
    if (user != null) {
      final docSnapshot =
          await _firestore.collection("users").doc(user.uid).get();

      // await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (docSnapshot.exists) {
        emit(state.copyWith(
            totalSalary: (docSnapshot.data()?["salary"] ?? 0).toDouble()));

        return docSnapshot.data()?['salary'];
      }
    } else {
      print("the data is not found");
    }
  }
}
