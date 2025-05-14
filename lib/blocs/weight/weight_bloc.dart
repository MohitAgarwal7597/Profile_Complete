import 'package:flutter_bloc/flutter_bloc.dart';

import 'weight_event.dart';
import 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightState.initial()) {
    on<UpdateWeight>((event, emit) {
      emit(state.copyWith(weight: event.weight));
    });

    on<ToggleUnit>((event, emit) {
      emit(state.copyWith(isKg: !state.isKg));
    });
  }
}
