import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_bloc.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_event.dart';
import 'package:flutter_application_expense/widgets/custom_textfield_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSpendAmtScreen extends StatelessWidget {
  const AddSpendAmtScreen({super.key});
  static Widget builder(BuildContext context) {
    Map<String, String?>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    return BlocProvider<AddSpendBloc>(
      create: ((context) => AddSpendBloc()..add(const AddSpendInitialEvent())),
      child: AddSpendAmtScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add spend amount"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFieldWidget(controller: tecController, title: "Amount"),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
