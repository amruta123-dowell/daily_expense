import 'package:equatable/equatable.dart';

class HomewidgetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialHomeWidgetEvent extends HomewidgetEvent {}

class OnselectedMonthEvent extends HomewidgetEvent {
  final int selectedIndex;
  OnselectedMonthEvent({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}

class CallSalaryAPIEvent extends HomewidgetEvent {}
