import 'package:equatable/equatable.dart';

import '../../../../utils/month.dart';

class HomewidgetState extends Equatable {
  final List<Month> listMonth = Month.getMonths;
  final Month? selectedMonth;
  HomewidgetState({this.selectedMonth});
  @override
  List<Object?> get props => [selectedMonth];

  HomewidgetState copyWith({Month? selectedMonth}) {
    return HomewidgetState(selectedMonth: selectedMonth ?? this.selectedMonth);
  }
}
