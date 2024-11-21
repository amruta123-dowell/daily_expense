import 'package:flutter/material.dart';

import 'package:flutter_application_expense/ui/home_screens/bloc/bottom_nav_bloc.dart';
import 'package:flutter_application_expense/ui/home_screens/bloc/bottom_nav_state.dart';
import 'package:flutter_application_expense/ui/home_screens/bloc/bottom_nav_event.dart';
import 'package:flutter_application_expense/ui/home_screens/home/home_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/bottom_navbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BottomNavBloc()..add(BottomNavInitialEvent());
      },
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: state.selectedNavItem == 1
              ? Container()
              : HomeWidget.builder(context),
          bottomNavigationBar: BottomNavbarWidget(
            onSelectedBottomItem: (val) {
              context
                  .read<BottomNavBloc>()
                  .add(OnSelectBottomNavItemEvent(selectedIndex: val));
            },
            selectedIndex: state.selectedNavItem ?? 0,
          ),
        );
      },
    );
  }
}
