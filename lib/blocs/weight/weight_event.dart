import 'package:equatable/equatable.dart';

abstract class WeightEvent extends Equatable {
  const WeightEvent();
}

class UpdateWeight extends WeightEvent {
  final double weight;

  const UpdateWeight(this.weight);

  @override
  List<Object> get props => [weight];
}

class ToggleUnit extends WeightEvent {
  const ToggleUnit();

  @override
  List<Object> get props => [];
}
