import 'package:flutter_bloc/flutter_bloc.dart';

import 'gender_event.dart';
import 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(GenderState.initial()) {
    on<SelectGender>((event, emit) {
      emit(state.copyWith(selectedGender: event.gender));
    });
  }
}
