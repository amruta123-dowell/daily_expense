import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignupState extends Equatable {
  final TextEditingController? emailController;
  final TextEditingController? passController;
  final TextEditingController? usernameController;
  final String? emailError;
  final String? passwordError;

  const SignupState({
    this.emailController,
    this.passController,
    this.usernameController,
    this.emailError,
    this.passwordError,
  });

  @override
  List<Object?> get props => [
        emailController,
        passController,
        usernameController,
        emailError,
        passwordError
      ];

  SignupState copyWith(
      {TextEditingController? emailController,
      TextEditingController? passwordController,
      TextEditingController? usernameController,
      String? emailError,
      String? passwordError}) {
    return SignupState(
        emailController: emailController ?? this.emailController,
        passController: passwordController ?? passController,
        usernameController: usernameController ?? this.usernameController,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.emailError);
  }
}
