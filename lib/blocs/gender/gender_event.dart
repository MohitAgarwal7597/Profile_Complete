import 'package:equatable/equatable.dart';

abstract class GenderEvent extends Equatable {
  const GenderEvent();
}

class SelectGender extends GenderEvent {
  final String gender;

  const SelectGender(this.gender);

  @override
  List<Object> get props => [gender];
}
