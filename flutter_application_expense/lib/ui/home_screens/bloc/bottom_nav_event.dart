import 'package:equatable/equatable.dart';

class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object?> get props => [];
}

class BottomNavInitialEvent extends BottomNavEvent {
  const BottomNavInitialEvent();
}

class OnSelectBottomNavItemEvent extends BottomNavEvent {
  final int? selectedIndex;
  const OnSelectBottomNavItemEvent({this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}
