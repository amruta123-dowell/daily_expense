import 'package:flutter/cupertino.dart';
import 'package:flutter_application_expense/ui/sign_in_screens/sign_in_screen.dart';
import 'package:flutter_application_expense/ui/sign_up_screens/sign_up_screen.dart';

class AppRoutes {
  static String signinScreen = "/signinScreen";
  static String signupScreen = "/signupScreen";

  Map<String, WidgetBuilder> get routes => {
        signinScreen: (context) => SignInScreen.builder(context),
        signupScreen: (context) => SignUpScreen.builder(context)
      };
}
