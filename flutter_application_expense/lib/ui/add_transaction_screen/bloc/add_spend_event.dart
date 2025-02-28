import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/enums/spend_cat_enum.dart';

class AddSpendEvent extends Equatable {
  const AddSpendEvent();

  @override
  List<Object?> get props => [];
}

class AddSpendInitialEvent extends AddSpendEvent {
  final SpendCat? selectedCat;
  final TransactionType? selectedTransactionType;
  // final TransactionType? transationType;
  @override
  List<Object?> get props => [selectedTransactionType, selectedCat];
  const AddSpendInitialEvent({this.selectedTransactionType, this.selectedCat});
}

class OnSelectSpendCatEvent extends AddSpendEvent {
  final SpendCat? selectedCatType;
  final TransactionType? selectedTransactionType;
  const OnSelectSpendCatEvent(
      {this.selectedCatType, this.selectedTransactionType});
  @override
  List<Object?> get props => [selectedCatType, selectedTransactionType];
}
