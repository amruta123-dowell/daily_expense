import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_expense/utils/app_routes.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';
import 'package:meta/meta.dart';

import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<CalculatorInitialEvent>(_initialize);
    on<OnChangeAmountEvent>(_onSelectedAmt);
    on<OnSubmitSalaryEvent>(_submitSalary);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FutureOr<void> _initialize(
      CalculatorInitialEvent event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(currentValue: 0));
  }

  FutureOr<void> _onSelectedAmt(
      OnChangeAmountEvent event, Emitter<CalculatorState> emit) async {
    emit(state.copyWith(currentValue: event.amount));
  }

  FutureOr<void> _submitSalary(
      OnSubmitSalaryEvent event, Emitter<CalculatorState> emit) async {
    state.currentValue;

    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      // Reference to the user's document in the "users" collection
      DocumentReference userDoc =
          _firestore.collection("users").doc(currentUser.uid);

      // Set or update the user's salary in Firestore
      await userDoc.set({
        "salary": state.currentValue,
        "email": currentUser.email,
        "uid": currentUser.uid
      }, SetOptions(merge: true));

      print("User salary updated successfully.");
      NavigatorClass().pushNamed(AppRoutes.homeScreen);
    } else {
      print("No user is currently logged in.");
    }
  }
}
