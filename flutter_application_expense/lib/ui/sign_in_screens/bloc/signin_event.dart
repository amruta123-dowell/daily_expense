import 'package:equatable/equatable.dart';

class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object?> get props => [];
}

class SubmitSigninEvent extends SigninEvent {
  const SubmitSigninEvent();
  @override
  List<Object?> get props => [];
}

class SigninInitializeEvent extends SigninEvent {}
