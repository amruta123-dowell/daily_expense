part of 'screen_two_bloc.dart';

class ScreenTwoState extends Equatable {
  final String? text;
  const ScreenTwoState({this.text = "abc"});
  @override
  List<Object?> get props => [text];
  ScreenTwoState copyWith({String? text}) {
    return ScreenTwoState(text: text ?? this.text);
  }
}
