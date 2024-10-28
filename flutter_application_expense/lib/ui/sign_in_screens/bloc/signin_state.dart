import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class SigninState extends Equatable {
  final String text = "abc";
  final TextEditingController? emailController;
  final TextEditingController? passController;
  final String? emailError;
  final String? passwordError;
  const SigninState({
    this.emailController,
    this.passController,
    this.emailError,
    this.passwordError,
  });

  @override
  List<Object?> get props =>
      [emailController, passController, emailError, passwordError];

  SigninState copyWith(
      {TextEditingController? emailController,
      TextEditingController? passController,
      String? emailError,
      String? passwordError}) {
    return SigninState(
        emailController: emailController ?? this.emailController,
        passController: passController ?? this.passController,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError);
  }
}
