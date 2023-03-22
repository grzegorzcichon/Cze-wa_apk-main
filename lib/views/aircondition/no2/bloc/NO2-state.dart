part of 'NO2-bloc.dart';

abstract class NO2State extends Equatable {
  NO2State();

  @override
  List<Object?> get props => [];
}

class NO2Initial extends NO2State {}

class NO2Loading extends NO2State {}

class NO2Loaded extends NO2State {
  final NO2Model no2Model;
  NO2Loaded(this.no2Model);
}

class NO2Error extends NO2State {
  final String? message;
  NO2Error(this.message);
}
