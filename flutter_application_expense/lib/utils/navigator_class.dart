import 'package:flutter/widgets.dart';

class NavigatorClass {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? pushNamed(String routeName, {dynamic arg}) async {
    return navigatorKey.currentState
        ?.pushNamed<Object?>(routeName, arguments: arg);
  }
}
