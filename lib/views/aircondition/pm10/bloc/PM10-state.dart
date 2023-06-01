part of 'PM10-bloc.dart';

abstract class PM10State extends Equatable {
  PM10State();

  @override
  List<Object?> get props => [];
}

class PM10Initial extends PM10State {}

class PM10Loading extends PM10State {}

class PM10Loaded extends PM10State {
  final PM10Model pm10Model;
  PM10Loaded(this.pm10Model);
}

class PM10Error extends PM10State {
  final String? message;
  PM10Error(this.message);
}
