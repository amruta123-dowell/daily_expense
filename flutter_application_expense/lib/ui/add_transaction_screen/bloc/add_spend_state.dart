import 'package:equatable/equatable.dart';

class AddSpendState extends Equatable {
  final List<String> catList = [
    "Shopping",
    "Travel",
    "Food",
    "Grocery",
    "Others"
  ];
  final String? selectedCat;

  AddSpendState({this.selectedCat});

  @override
  List<Object?> get props => [selectedCat];
}
