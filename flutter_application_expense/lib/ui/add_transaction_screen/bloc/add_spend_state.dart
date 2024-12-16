import 'package:equatable/equatable.dart';
import 'package:flutter_application_expense/data/global_values.dart';

import '../../../enums/spend_cat.dart';

class AddSpendState extends Equatable {
  final List<SpendCat> catList = [
    SpendCat.shop,
    SpendCat.travel,
    SpendCat.food,
    SpendCat.grocery,
    SpendCat.others
  ];
  final SpendCat? selectedCat;

  AddSpendState({
    this.selectedCat,
  });

  @override
  List<Object?> get props => [
        selectedCat,
      ];

  AddSpendState copyWith(
      {SpendCat? selectedCat, bool? enableCount, int? count}) {
    return AddSpendState(
      selectedCat: selectedCat ?? this.selectedCat,
    );
  }
}
