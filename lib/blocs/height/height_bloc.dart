import 'package:flutter_bloc/flutter_bloc.dart';

import 'height_event.dart';
import 'height_state.dart';

class HeightBloc extends Bloc<HeightEvent, HeightState> {
  HeightBloc() : super(HeightState.initial()) {
    on<UpdateHeight>((event, emit) {
      emit(state.copyWith(height: event.height));
    });
  }
}
