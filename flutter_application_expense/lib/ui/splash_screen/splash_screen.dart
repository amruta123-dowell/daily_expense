import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/splash_screen/bloc/splash_bloc.dart';
import 'package:flutter_application_expense/utils/image_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(SplashInitialEvent()),
      child: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: LottieBuilder.asset(
            ImageConstant.splashImg,
            height: double.infinity,
            // width: double.infinity,
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
