import 'package:equatable/equatable.dart';

class BottomNavState extends Equatable {
  final int? selectedNavItem;

  const BottomNavState({this.selectedNavItem});
  @override
  List<Object?> get props => [selectedNavItem];

  BottomNavState copyWith({
    int? bottomNavItem,
  }) {
    return BottomNavState(
      selectedNavItem: bottomNavItem ?? selectedNavItem,
    );
  }
}
