import 'package:equatable/equatable.dart';

class HeightState extends Equatable {
  final int height;

  const HeightState({required this.height});

  factory HeightState.initial() => const HeightState(height: 165);

  HeightState copyWith({int? height}) {
    return HeightState(height: height ?? this.height);
  }

  @override
  List<Object> get props => [height];
}
