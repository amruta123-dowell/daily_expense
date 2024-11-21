import 'package:equatable/equatable.dart';

class AddSpendEvent extends Equatable {
  const AddSpendEvent();

  @override
  List<Object?> get props => [];
}

class AddSpendInitialEvent extends AddSpendEvent {
  final String? selectedCat;
  @override
  List<Object?> get props => [selectedCat];
  const AddSpendInitialEvent({this.selectedCat});
}

class OnSelectSpendCatEvent extends AddSpendEvent {
  final String? selectedItem;
  const OnSelectSpendCatEvent({this.selectedItem});
  @override
  List<Object?> get props => [selectedItem];
}
