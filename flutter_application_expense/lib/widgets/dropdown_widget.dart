import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_expense/utils/month.dart';

class DropdownWidget<T> extends StatelessWidget {
  final double? height;
  final double? width;
  final T? selectedItem;
  final List<T> itemList;
  const DropdownWidget(
      {super.key,
      this.height,
      this.width,
      this.selectedItem,
      required this.itemList});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MonthSelector extends StatelessWidget {
  final List<Month> monthList;
  final Month? selectedMonth;
  final Function(int) onChangeMonth;
  final FixedExtentScrollController _controller =
      FixedExtentScrollController(initialItem: DateTime.now().month - 1);

  MonthSelector(
      {super.key,
      required this.monthList,
      required this.selectedMonth,
      required this.onChangeMonth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30, // Fixed height for the container
      width: 120,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 226, 229),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 50, // Height of each item to snap each month into view
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Center(
              child: Text(
                monthList[index % 12].name, // Loop over months
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 87, 86, 86),
                ),
              ),
            );
          },
          childCount: monthList.length,
        ),
        onSelectedItemChanged: (index) {
          onChangeMonth(index);
        },
      ),
    );
  }
}
