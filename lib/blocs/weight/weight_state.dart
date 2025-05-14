import 'package:equatable/equatable.dart';

class WeightState extends Equatable {
  final double weight;
  final bool isKg;

  const WeightState({required this.weight, required this.isKg});

  factory WeightState.initial() => const WeightState(weight: 60, isKg: true);

  WeightState copyWith({double? weight, bool? isKg}) {
    return WeightState(
      weight: weight ?? this.weight,
      isKg: isKg ?? this.isKg,
    );
  }

  @override
  List<Object> get props => [weight, isKg];
}
