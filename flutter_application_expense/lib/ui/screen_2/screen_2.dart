import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/screen_one/bloc/screen_one_bloc.dart';
import 'package:flutter_application_expense/utils/navigator_class.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_routes.dart';
import 'bloc/screen_two_bloc.dart';

class ScreenTwo extends StatelessWidget {
  // const ScreenTwo({super.key});
  // static Widget builder(BuildContext context) {
  //   return 
  //     child: const ScreenTwo(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ScreenTwoBloc, ScreenTwoState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<ScreenTwoBloc>().add(OnclickButton2Event());
                  context.read<ScreenOneBloc>().add(ChangeDisableEVent());
                },
                child: Container(
                    color: Colors.pink,
                    height: 100,
                    child: const Text("Button 2 ")),
              );
            },
          ),
        ],
      ),
    );
  }
}
