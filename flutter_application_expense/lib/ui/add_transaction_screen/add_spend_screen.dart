import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_bloc.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_event.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_state.dart';

import 'package:flutter_application_expense/widgets/custom_textfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/spend_cat.dart';

class AddSpendAmtScreen extends StatelessWidget {
  const AddSpendAmtScreen({super.key});
  static Widget builder(BuildContext context) {
    Map<String, SpendCat>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, SpendCat>?;

    return BlocProvider<AddSpendBloc>(
      create: ((context) => AddSpendBloc()
        ..add(AddSpendInitialEvent(selectedCat: args?["spendCat"]))),
      child: AddSpendAmtScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add spend amount"),
        backgroundColor: Color.fromARGB(255, 192, 226, 238),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 240, 223),
      body: BlocBuilder<AddSpendBloc, AddSpendState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              CustomTextFieldWidget(
                controller: tecController,
                title: "Add Amount",
                textType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}
