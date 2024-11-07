import 'package:flutter/material.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog(
      {BuildContext? context, isCancellable = false}) async {
    if (!isProgressVisible &&
        NavigatorClass.navigatorKey.currentState?.overlay?.context != null) {
      showDialog(
          barrierDismissible: isCancellable,
          context: NavigatorClass.navigatorKey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            );
          });
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) {
      NavigatorClass().pop();
    }
    isProgressVisible = false;
  }
}
