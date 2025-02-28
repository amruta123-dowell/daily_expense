import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/data/global_values.dart';
import 'package:flutter_application_expense/utils/image_constant.dart';

import '../../../../utils/month.dart';

class HomeWidgetState extends Equatable {
  final List<Month> listMonth = Month.getMonths;
  final Month? selectedMonth;
  final double? totalSalary;
  final List<Map<String, dynamic>> categoryList = expenseCatList;
  // [
  //   {"title": "Shopping", "img": ImageConstant.shoppingIcon},
  //   {"title": "Travel", "img": ImageConstant.travelIcon},
  //   {"title": "Food", "img": ImageConstant.foodIcon},
  //   {"title": "Grocery", "img": ImageConstant.groceryIcon},
  //   {"title": "Others", "img": ImageConstant.otherExpenseIcon},
  // ];
  final List<Map<String, dynamic>> transactionTypeList = transactionCatList;
  // [
  //   {"title": "PhonePay", "img": ImageConstant.phonePayIcon},
  //   {"title": "GooglePay", "img": ImageConstant.googlePayIcon},
  //   {"title": "Paytm", "img": ImageConstant.paytmIcon},
  //   {"title": "Netbanking", "img": ImageConstant.netbankingIcon},
  //   {"title": "Other Payment", "img": ImageConstant.otherPaymentIcon}
  // ];
  final bool? showIcon;
  HomeWidgetState({this.selectedMonth, this.totalSalary, this.showIcon = true});
  @override
  List<Object?> get props => [selectedMonth, totalSalary, showIcon];

  HomeWidgetState copyWith(
      {Month? selectedMonth, double? totalSalary, bool? showIcon}) {
    return HomeWidgetState(
        selectedMonth: selectedMonth ?? this.selectedMonth,
        totalSalary: totalSalary ?? this.totalSalary,
        showIcon: showIcon ?? this.showIcon);
  }
}
