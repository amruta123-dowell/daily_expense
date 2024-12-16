import 'package:flutter/cupertino.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/add_spend_screen.dart';
import 'package:flutter_application_expense/ui/calculator_screen/calculator_screen.dart';
import 'package:flutter_application_expense/ui/home_screens/home_screen.dart';
import 'package:flutter_application_expense/ui/initial_screen/initial_screen.dart';
import 'package:flutter_application_expense/ui/screen_2/screen_2.dart';
import 'package:flutter_application_expense/ui/screen_one/screen_one.dart';
import 'package:flutter_application_expense/ui/sign_in_screens/sign_in_screen.dart';
import 'package:flutter_application_expense/ui/sign_up_screens/sign_up_screen.dart';

class AppRoutes {
  static String signinScreen = "/signinScreen";
  static String signupScreen = "/signupScreen";
  static String homeScreen = "/homeScreen";
  static String initialScreen = "/initialScreen";
  static String calculatorScreen = "/calculatorScreen";
  static String addTransactionScreen = "/addTransactionScreen";
  static String addSpendAmtScreen = "/addSpendAmtScreen";
  static String screen1 = "/screen1";
  static String screen2 = "/screen2";

  Map<String, WidgetBuilder> get routes => {
        signinScreen: (context) => SignInScreen.builder(context),
        signupScreen: (context) => SignUpScreen.builder(context),
        homeScreen: (context) => HomeScreen.builder(context),
        initialScreen: InitialScreen.builder,
        calculatorScreen: CalculatorScreen.builder,
        addSpendAmtScreen: (context) => AddSpendAmtScreen.builder(context),
        screen1: (context) => ScreenOne.builder(context),
        // screen2: (context)=> ScreenTwo.builder(context)
      };
}
