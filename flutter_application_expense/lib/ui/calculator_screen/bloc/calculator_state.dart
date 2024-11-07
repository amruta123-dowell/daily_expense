import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CalculatorState extends Equatable {
  final double? currentValue;
  final TextEditingController? salaryTecController;

  const CalculatorState({this.currentValue, this.salaryTecController});

  @override
  List<Object?> get props => [currentValue, salaryTecController];

  CalculatorState copyWith(
      {double? currentValue, TextEditingController? salaryController}) {
    return CalculatorState(
        currentValue: currentValue ?? this.currentValue,
        salaryTecController: salaryController ?? this.salaryTecController);
  }
}
