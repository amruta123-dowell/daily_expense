import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_expense/data/api_provider.dart';
import 'package:flutter_application_expense/models/user_model.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';

import '../../../utils/app_routes.dart';
import '../../../utils/validators.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<InitializeSignupEvent>(_initialize);
    on<OnclickSignupEvent>(_onClickSignup);
  }

  final ApiProvider _apiProvider = ApiProvider();
  FutureOr<void> _initialize(
      InitializeSignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }

  FutureOr<void> _onClickSignup(
      OnclickSignupEvent event, Emitter<SignupState> emit) async {
    if (!_validateTextField(emit)) {
      return;
    }
    if (((state.emailController?.text.isNotEmpty) ?? false) &&
        ((state.passController?.text.isNotEmpty) ?? false)) {
      String email = (state.emailController?.text ?? "");
      String password = state.passController?.text ?? "";

      await _apiProvider
          .signup(email: email, password: password)
          .then((result) async {
        if (result.isSuccess) {
          UserModel newUser = UserModel(
              email: email, pass: password, uid: result.data?.user?.uid);
          // final usersCollectionRef = await FirebaseFirestore.instance
          //     .collection("(default)")
          //     .doc(result.data?.user?.uid)
          //     .get();
          // usersCollectionRef;
          emit(state.copyWith(userData: result.data));
          NavigatorClass().pushNamed(AppRoutes.homeScreen);
        } else if (result.isFailure) {
          event.onFailure?.call("${result.error}");
        }
      });
    }
  }

  bool _validateTextField(Emitter<SignupState> emit) {
    String emailError = _emailValidation;
    String passwordError = _passwordValidation;
    emit(state.copyWith(emailError: emailError, passwordError: passwordError));

    if (emailError.isEmpty || passwordError.isEmpty) {
      return true;
    }
    return false;
  }

  String get _emailValidation {
    String? error =
        Validators().validateEmail(state.emailController?.text ?? '');
    return error ?? '';
  }

  String get _passwordValidation {
    String? error = Validators().validateText(state.passController?.text ?? "");
    return error ?? '';
  }
}
