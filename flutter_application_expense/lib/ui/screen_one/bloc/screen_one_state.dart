part of 'screen_one_bloc.dart';

class ScreenOneState extends Equatable {
  final bool? disable;

  ScreenOneState({this.disable = false});

  @override
  List<Object?> get props => [this.disable];

  ScreenOneState copyWith({bool? disable}) {
    return ScreenOneState(disable: disable ?? this.disable);
  }
}
