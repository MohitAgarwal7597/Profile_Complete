import 'package:equatable/equatable.dart';

class GenderState extends Equatable {
  final String selectedGender;

  const GenderState({required this.selectedGender});

  factory GenderState.initial() => const GenderState(selectedGender: '');

  GenderState copyWith({String? selectedGender}) {
    return GenderState(
      selectedGender: selectedGender ?? this.selectedGender,
    );
  }

  @override
  List<Object> get props => [selectedGender];
}
