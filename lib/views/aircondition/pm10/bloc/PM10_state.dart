part of 'PM10_bloc.dart';

abstract class PM10State extends Equatable {
  PM10State();

  @override
  List<Object?> get props => [];
}

class NO2dInitial extends PM10State {}

class NO2Loading extends PM10State {}

class NO2Loaded extends PM10State {
  final NO2Model no2Model;
  NO2Loaded(this.no2Model);
}

class NO2Error extends PM10State {
  final String? message;
  NO2Error(this.message);
}
