import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/enums/spend_cat.dart';

class AddSpendEvent extends Equatable {
  const AddSpendEvent();

  @override
  List<Object?> get props => [];
}

class AddSpendInitialEvent extends AddSpendEvent {
  final SpendCat? selectedCat;
  @override
  List<Object?> get props => [selectedCat];
  const AddSpendInitialEvent({this.selectedCat});
}

class OnSelectSpendCatEvent extends AddSpendEvent {
  final int? selectedItem;
  const OnSelectSpendCatEvent({this.selectedItem});
  @override
  List<Object?> get props => [selectedItem];
}
