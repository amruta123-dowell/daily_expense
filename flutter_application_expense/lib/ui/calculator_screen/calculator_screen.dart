import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_expense/ui/calculator_screen/bloc/calculator_bloc.dart';
import 'package:flutter_application_expense/ui/calculator_screen/bloc/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

import 'bloc/calculator_event.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider(
        create: (context) => CalculatorBloc()..add(CalculatorInitialEvent()),
        child: CalculatorScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Total Salary Per Month",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.greenAccent,
                          ),
                          child: Text("${state.currentValue} \u20B9")),
                      InkWell(
                        onTap: () {
                          context
                              .read<CalculatorBloc>()
                              .add(OnSubmitSalaryEvent());
                        },
                        child: Container(
                          height: 50,
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.yellowAccent,
                      height: MediaQuery.of(context).size.height - 400,
                      width: MediaQuery.of(context).size.width,
                      child: SimpleCalculator(
                        hideSurroundingBorder: true,
                        onChanged: (val1, val2, val3) {
                          print("on changed one ---> $val1");
                          print("on changed two ----> $val2");

                          print("on changed three ------------> $val3");
                          if (val1 == "=") {
                            context
                                .read<CalculatorBloc>()
                                .add(OnChangeAmountEvent(amount: val2));
                          }
                        },
                        onTappedDisplay: (val, val2) {
                          print(
                              "onTap----------------------------------->$val");
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
