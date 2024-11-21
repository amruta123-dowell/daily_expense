import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/utils/image_constant.dart';

import '../../../../utils/month.dart';

class HomeWidgetState extends Equatable {
  final List<Month> listMonth = Month.getMonths;
  final Month? selectedMonth;
  final double? totalSalary;
  final List<Map<String, dynamic>> categoryList = [
    {"title": "Shopping", "img": ImageConstant.shoppingIcon},
    {"title": "Travel", "img": ImageConstant.travelIcon},
    {"title": "Food", "img": ImageConstant.foodIcon},
    {"title": "Grocery", "img": ImageConstant.groceryIcon},
    {"title": "Others", "img": ImageConstant.otherExpenseIcon},
  ];
  final List<Map<String, String>> transactionTypelist = [
    {"title": "PhonePay", "img": ImageConstant.phonePayIcon},
    {"title": "GooglePay", "img": ImageConstant.googlePayIcon},
    {"title": "Paytm", "img": ImageConstant.paytmIcon},
    {"title": "Netbanking", "img": ImageConstant.netbankingIcon},
    {"title": "Other Payment", "img": ImageConstant.otherPaymentIcon}
  ];

  HomeWidgetState({this.selectedMonth, this.totalSalary});
  @override
  List<Object?> get props => [selectedMonth, totalSalary];

  HomeWidgetState copyWith({Month? selectedMonth, double? totalSalary}) {
    return HomeWidgetState(
        selectedMonth: selectedMonth ?? this.selectedMonth,
        totalSalary: totalSalary ?? this.totalSalary);
  }
}
