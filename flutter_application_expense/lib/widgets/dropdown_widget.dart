import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_expense/utils/month.dart';

import '../enums/spend_cat_enum.dart';

class DropdownWidget<T> extends StatelessWidget {
  final double? height;
  final double? width;
  final T? selectedItem;
  final List<T> itemList;
  final String? title;
  final Function(T?) onSelectedItem;
  const DropdownWidget(
      {super.key,
      this.height,
      this.width,
      this.selectedItem,
      required this.itemList,
      this.title,
      required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
        Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 247, 247),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              value: selectedItem,
              isDense: true,
              isExpanded: true,
              hint: selectedItem != null
                  ? Text(_itemDisplay(selectedItem))
                  : null,
              items: itemList.map((item) {
                return DropdownMenuItem<T>(
                    value: item,
                    child: Text(
                      _itemDisplay(item),
                      style: const TextStyle(color: Colors.black),
                    ));
              }).toList(),
              onChanged: (value) {
                onSelectedItem(value);
                // print(value);
              },
              underline: const Divider(
                color: Colors.pink,
                height: 2,
              ),
              dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 248, 247, 247))),
            ),
          ),
        ),
      ],
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 226, 229),
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
                style: const TextStyle(
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

String _itemDisplay(item) {
  switch (item.runtimeType) {
    case const (String):
      return item.toString();
    case const (SpendCat):
      return (item as SpendCat).desc;
    case const (TransactionType):
      return (item as TransactionType).transaction;

    default:
      return item.toString();
  }
}
