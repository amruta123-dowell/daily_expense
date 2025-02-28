import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/data/global_values.dart';

import '../../../enums/spend_cat_enum.dart';

class AddSpendState extends Equatable {
  final List<SpendCat> catList =
      expenseCatList.map((ele) => (ele["title"] as SpendCat)).toList();
  final SpendCat? selectedCat;
  final bool? isTransactionType;
  final TransactionType? selectedTransactionType;

  final List<TransactionType> transactionTypeList = transactionCatList
      .map((ele) => (ele['title'] as TransactionType))
      .toList();
  AddSpendState(
      {this.selectedCat, this.isTransactionType, this.selectedTransactionType});

  @override
  List<Object?> get props =>
      [selectedCat, isTransactionType, selectedTransactionType];

  AddSpendState copyWith(
      {SpendCat? selectedCat,
      bool? isTransactionType,
      TransactionType? selectedTransactionType}) {
    return AddSpendState(
        selectedCat: selectedCat ?? this.selectedCat,
        isTransactionType: isTransactionType ?? this.isTransactionType,
        selectedTransactionType:
            selectedTransactionType ?? this.selectedTransactionType);
  }
}
