import 'package:equatable/equatable.dart';

class Month extends Equatable {
  final String name;
  final int id;

  const Month({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
  static List<Month> get getMonths => const [
        Month(name: "January", id: 1),
        Month(name: "February", id: 2),
        Month(name: "March", id: 3),
        Month(name: "April", id: 4),
        Month(name: "May", id: 5),
        Month(name: "June", id: 6),
        Month(name: "July", id: 7),
        Month(name: "August", id: 8),
        Month(name: "September", id: 9),
        Month(name: "October", id: 10),
        Month(name: "November", id: 11),
        Month(name: "December", id: 12),
      ];
}
