import 'package:equatable/equatable.dart';

import '../../../../enums/spend_cat_enum.dart';

class HomeWidgetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialHomeWidgetEvent extends HomeWidgetEvent {}

class OnselectedMonthEvent extends HomeWidgetEvent {
  final int selectedIndex;
  OnselectedMonthEvent({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}

class CallSalaryAPIEvent extends HomeWidgetEvent {}

class OnSelectedExpenseCatEvent extends HomeWidgetEvent {
  final int selectedCatIndex;
  final bool? isSelectedTransaction;
  OnSelectedExpenseCatEvent(
      {required this.selectedCatIndex, this.isSelectedTransaction});
  @override
  List<Object?> get props => [selectedCatIndex];
}
