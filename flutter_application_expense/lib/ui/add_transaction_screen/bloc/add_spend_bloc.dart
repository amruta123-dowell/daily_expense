import 'package:bloc/bloc.dart';

import 'add_spend_event.dart';
import 'add_spend_state.dart';

class AddSpendBloc extends Bloc<AddSpendEvent, AddSpendState> {
  AddSpendBloc() : super(AddSpendState()){}
}

