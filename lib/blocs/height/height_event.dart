import 'package:equatable/equatable.dart';

abstract class HeightEvent extends Equatable {
  const HeightEvent();
}

class UpdateHeight extends HeightEvent {
  final int height;

  const UpdateHeight(this.height);

  @override
  List<Object> get props => [height];
}
