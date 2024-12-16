import 'package:equatable/equatable.dart';

import '../../../../enums/spend_cat.dart';

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
  OnSelectedExpenseCatEvent({required this.selectedCatIndex});
  @override
  List<Object?> get props => [selectedCatIndex];
}
