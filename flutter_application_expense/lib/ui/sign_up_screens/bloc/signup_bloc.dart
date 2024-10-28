import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FutureOr<void> _initialize(
      InitializeSignupEvent event, Emitter<SignupState> emit) {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }

  FutureOr<void> _onClickSignup(
      OnclickSignupEvent event, Emitter<SignupState> emit) async {
    if (((state.emailController?.text.isNotEmpty) ?? false) &&
        ((state.passController?.text.isNotEmpty) ?? false)) {
      String email = (state.emailController?.text ?? "");
      String password = state.passController?.text ?? "";
      if (_validateTextField(emit)) {
        return;
      }
      try {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        NavigatorClass().pushNamed(AppRoutes.signinScreen);
      } catch (error) {
        print("Something went wrong. unable to sign in");
      }
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
