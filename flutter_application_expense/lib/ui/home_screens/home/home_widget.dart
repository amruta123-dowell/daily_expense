import 'package:flutter/material.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_bloc.dart';
import 'package:flutter_application_expense/ui/add_transaction_screen/bloc/add_spend_state.dart';

import 'package:flutter_application_expense/ui/home_screens/home/home_bloc/home_widget_bloc.dart';
import 'package:flutter_application_expense/ui/home_screens/home/home_bloc/home_widget_event.dart';
import 'package:flutter_application_expense/ui/home_screens/home/home_bloc/home_widget_state.dart';
import 'package:flutter_application_expense/widgets/dropdown_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  static Widget builder(BuildContext context) {
    return MultiBlocProvider(providers: [
      // BlocProvider<AddSpendBloc>(create: (context) => AddSpendBloc()),
      BlocProvider<HomeWidgetBloc>(
        create: (context) => HomeWidgetBloc()..add(InitialHomeWidgetEvent()),
      ),
    ], child: HomeWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(238, 109, 123, 168), Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: BlocBuilder<HomeWidgetBloc, HomeWidgetState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Align(
                  child: MonthSelector(
                      monthList: state.listMonth,
                      selectedMonth: state.selectedMonth,
                      onChangeMonth: (val) {
                        context
                            .read<HomeWidgetBloc>()
                            .add(OnselectedMonthEvent(selectedIndex: val));
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "\u20B9 ${state.totalSalary?.toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Monthly cash flow",
                  style: TextStyle(
                    color: Color.fromARGB(255, 204, 200, 200),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _IncomeExpensesWidget(
                    expense: "0", income: (state.totalSalary ?? 0).toString()),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 15,
                      right: 15,
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(236, 147, 150, 161),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Spend Analysis",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          _ExpenseCategoryWidget(
                            onSelectedCat: (index) {
                              context.read<HomeWidgetBloc>().add(
                                  OnSelectedExpenseCatEvent(
                                      selectedCatIndex: index));
                            },
                            catList: state.categoryList,
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            "Transactions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _TransactionTypeListWidget(
                            transactionTypelist: state.transactionTypeList,
                            onSelectedTransactionIndex: (index) {
                              context.read<HomeWidgetBloc>().add(
                                  OnSelectedExpenseCatEvent(
                                      selectedCatIndex: index,
                                      isSelectedTransaction: true));
                            },
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _IncomeExpensesWidget extends StatelessWidget {
  final String income;
  final String expense;
  const _IncomeExpensesWidget(
      {super.key, required this.expense, required this.income});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: _AmountWidget(
              amt: income,
            ),
          ),
          Container(
            width: 1,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: _AmountWidget(
              amt: expense,
              isExpense: true,
            ),
          )
        ],
      ),
    );
  }
}

class _AmountWidget extends StatelessWidget {
  final String amt;
  final bool? isExpense;
  const _AmountWidget({super.key, required this.amt, this.isExpense = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Icon(
            isExpense == true ? Icons.remove_circle : Icons.add_circle,
            color: isExpense == true ? Colors.red : Colors.green,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$amt \u20B9",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              isExpense == true ? "Expense" : "Income",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ExpenseCategoryWidget extends StatelessWidget {
  final List<Map<String, dynamic>> catList;
  final Function(int selectedCatIndex) onSelectedCat;
  const _ExpenseCategoryWidget(
      {super.key, required this.catList, required this.onSelectedCat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onSelectedCat(index);
              },
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  height: 100,
                  width: 180,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 244, 244),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                          height: 120,
                          width: 80,
                          child: Image.asset(catList[index]["img"])),
                      Text(
                        "0%",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(catList[index]["title"].desc),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: catList.length),
    );
  }
}

class _TransactionTypeListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> transactionTypelist;
  final Function(int index) onSelectedTransactionIndex;
  const _TransactionTypeListWidget(
      {super.key,
      required this.transactionTypelist,
      required this.onSelectedTransactionIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            onSelectedTransactionIndex(index);
          },
          child: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 245, 244, 244),
              border: const Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child:
                              Image.asset(transactionTypelist[index]["img"])),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionTypelist[index]['title'].transaction,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: 60,
                    child: Text(
                      "240 \u20B9",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: transactionTypelist.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
