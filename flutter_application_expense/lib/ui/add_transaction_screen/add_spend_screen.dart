import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_bloc.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_event.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_state.dart';

import 'package:flutter_application_expense/widgets/custom_textfield_widget.dart';
import 'package:flutter_application_expense/widgets/dropdown_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/spend_cat_enum.dart';

class AddSpendAmtScreen extends StatelessWidget {
  const AddSpendAmtScreen({super.key});
  static Widget builder(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return BlocProvider<AddSpendBloc>(
      create: ((context) => AddSpendBloc()
        ..add(AddSpendInitialEvent(
            selectedCat: args?["spendCat"],
            selectedTransactionType: args?["transactionType"]))),
      child: AddSpendAmtScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add spend amount"),
        backgroundColor: Color.fromARGB(255, 192, 226, 238),
      ),
      backgroundColor: const Color.fromARGB(255, 223, 240, 223),
      body: BlocBuilder<AddSpendBloc, AddSpendState>(builder: (context, state) {
        final TextEditingController tecController = TextEditingController();
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
              state.isTransactionType == true
                  ? DropdownWidget(
                      selectedItem: state.selectedTransactionType,
                      itemList: state.transactionTypeList,
                      title: "Transaction Type",
                      onSelectedItem: (value) {
                        context.read<AddSpendBloc>().add(OnSelectSpendCatEvent(
                            selectedTransactionType: value));
                      },
                    )
                  : DropdownWidget(
                      selectedItem: state.selectedCat,
                      itemList: state.catList,
                      title: "Spend Category",
                      onSelectedItem: (value) {
                        context
                            .read<AddSpendBloc>()
                            .add(OnSelectSpendCatEvent(selectedCatType: value));
                      },
                    ),
              const SizedBox(height: 35),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color.fromARGB(255, 192, 226, 238),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )))
            ],
          ),
        );
      }),
    );
  }
}
