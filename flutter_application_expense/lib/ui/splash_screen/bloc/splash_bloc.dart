import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';
import 'package:meta/meta.dart';

import '../../../utils/app_routes.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEvent>((event, emit) {});
    on<SplashInitialEvent>(_navigateToNextScreen);
  }

  FutureOr<void> _navigateToNextScreen(
      SplashInitialEvent event, Emitter<SplashState> emit) {
    Future.delayed(Duration(seconds: 1)).then((value) {
      NavigatorClass().pushNamed(AppRoutes.signinScreen);
    });
  }
}
