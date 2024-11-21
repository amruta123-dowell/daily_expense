import 'package:equatable/equatable.dart';

class CalculatorEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnChangeAmountEvent extends CalculatorEvent {
  final double? amount;
  OnChangeAmountEvent({this.amount});
  @override
  List<Object?> get props => [amount];
}

class CalculatorInitialEvent extends CalculatorEvent {}

class OnSubmitSalaryEvent extends CalculatorEvent {
  OnSubmitSalaryEvent();
}
