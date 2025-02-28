import 'package:flutter_application_expense/utils/image_constant.dart';

import '../enums/spend_cat_enum.dart';

final List<Map<String, dynamic>> expenseCatList = [
  {"title": SpendCat.shop, "img": ImageConstant.shoppingIcon},
  {"title": SpendCat.travel, "img": ImageConstant.travelIcon},
  {"title": SpendCat.food, "img": ImageConstant.foodIcon},
  {"title": SpendCat.grocery, "img": ImageConstant.groceryIcon},
  {"title": SpendCat.others, "img": ImageConstant.otherExpenseIcon},
];
final List<Map<String, dynamic>> transactionCatList = [
  {"title": TransactionType.phonePay, "img": ImageConstant.phonePayIcon},
  {"title": TransactionType.googlePay, "img": ImageConstant.googlePayIcon},
  {"title": TransactionType.paytm, "img": ImageConstant.paytmIcon},
  {"title": TransactionType.netBanking, "img": ImageConstant.netbankingIcon},
  {"title": TransactionType.otherPayment, "img": ImageConstant.otherPaymentIcon}
];
