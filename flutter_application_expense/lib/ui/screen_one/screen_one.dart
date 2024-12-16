import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/screen_2/bloc/screen_two_bloc.dart';
import 'package:flutter_application_expense/ui/screen_2/screen_2.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/screen_one_bloc.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});
  static Widget builder(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ScreenOneBloc>(
        create: (_) => ScreenOneBloc(),
      ),
      BlocProvider<ScreenTwoBloc>(
        create: (_) => ScreenTwoBloc(),
      ),
    ], child: ScreenOne());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 1")),
      body: BlocBuilder<ScreenOneBloc, ScreenOneState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<ScreenOneBloc>(context),
                                child: BlocProvider.value(
                                  value:
                                      BlocProvider.of<ScreenTwoBloc>(context),
                                  child: ScreenTwo(),
                                ),
                              )),
                    );
                  },
                  child: Container(
                      color: Colors.pink,
                      height: 100,
                      child: const Text("Button1 "))),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ScreenTwoBloc, ScreenTwoState>(
                  builder: (context, bloc2state) {
                return Text("state 2 value ----------> ${bloc2state.text}");
              }),
              BlocBuilder<ScreenOneBloc, ScreenOneState>(
                  builder: (context, state) {
                return state.disable == false
                    ? Container(
                        height: 100,
                        width: 200,
                        child: const Text("enable container"),
                      )
                    : Container(
                        child: Text(
                          "disable container",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
              })
            ],
          );
        },
      ),
    );
  }
}
