part of 'SO2-bloc.dart';

abstract class SO2State extends Equatable {
  SO2State();

  @override
  List<Object?> get props => [];
}

class SO2dInitial extends SO2State {}

class SO2Loading extends SO2State {}

class SO2Loaded extends SO2State {
  final SO2Model so2Model;
  SO2Loaded(this.so2Model);
}

class SO2Error extends SO2State {
  final String? message;
  SO2Error(this.message);
}
