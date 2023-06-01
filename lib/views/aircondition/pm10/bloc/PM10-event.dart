part of 'PM10-bloc.dart';

abstract class PM10Event extends Equatable {
  const PM10Event();

  @override
  List<Object> get props => [];
}

class GetPM10List extends PM10Event {}
