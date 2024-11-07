import 'package:flutter/material.dart';
import 'package:flutter_application_expense/utils/image_constant.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';
import 'package:flutter_application_expense/widgets/submit_button.dart';

import '../../utils/app_routes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  static Widget builder(BuildContext context) {
    return InitialScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: Stack(
          children: [
            Align(
                child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(ImageConstant.expenseIcon))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Track Your Daily Spending and Savings Goals",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "This app is designed to help users manage their daily expenses by providing insights into their spending and saving habits. Users can record their expenses to see how much they’re spending from their savings and how much they’ve managed to set aside. By tracking spending patterns, the app enables users to better control their finances and work towards their savings goals. Daily logs and summaries give a clear picture of spending categories and highlight opportunities to save more. With a simple and intuitive interface, users can easily monitor their financial health and make more informed budgeting decisions.",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.maxFinite,
                height: 50,
                child: SubmitButton(
                  onClickButton: () {
                    NavigatorClass().pushNamed(AppRoutes.calculatorScreen);
                  },
                  text: "Let's Start",
                  textStyle: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
