import 'package:flutter_application_expense/utils/image_constant.dart';

import '../enums/spend_cat.dart';

final List<Map<String, dynamic>> expenseCatList = [
  {"title": SpendCat.shop, "img": ImageConstant.shoppingIcon},
  {"title": SpendCat.travel, "img": ImageConstant.travelIcon},
  {"title": SpendCat.food, "img": ImageConstant.foodIcon},
  {"title": SpendCat.grocery, "img": ImageConstant.groceryIcon},
  {"title": SpendCat.others, "img": ImageConstant.otherExpenseIcon},
];
final List<Map<String, String>> transactionCatList = [
  {"title": "PhonePay", "img": ImageConstant.phonePayIcon},
  {"title": "GooglePay", "img": ImageConstant.googlePayIcon},
  {"title": "Paytm", "img": ImageConstant.paytmIcon},
  {"title": "Netbanking", "img": ImageConstant.netbankingIcon},
  {"title": "Other Payment", "img": ImageConstant.otherPaymentIcon}
];

