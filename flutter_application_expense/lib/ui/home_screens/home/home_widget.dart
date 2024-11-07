import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_expense/ui/home_screens/home/home_bloc/home_widget_bloc.dart';
import 'package:flutter_application_expense/ui/home_screens/home/home_bloc/home_widget_event.dart';
import 'package:flutter_application_expense/ui/home_screens/home/home_bloc/home_widget_state.dart';
import 'package:flutter_application_expense/widgets/dropdown_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomewidgetBloc()..add(InitialHomeWidgetEvent()),
      child: HomeWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.cyan, Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 30),
        child: BlocBuilder<HomewidgetBloc, HomewidgetState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  child: MonthSelector(
                      monthList: state.listMonth,
                      selectedMonth: state.selectedMonth,
                      onChangeMonth: (val) {
                        context
                            .read<HomewidgetBloc>()
                            .add(OnselectedMonthEvent(selectedIndex: val));
                      }),
                ),
                Text("Sorry.. You have added any amount...Let's Start"),
              ],
            );
          },
        ),
      ),
    );
  }
}
