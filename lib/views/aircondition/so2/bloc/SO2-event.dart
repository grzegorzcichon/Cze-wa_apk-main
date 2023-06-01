part of 'SO2-bloc.dart';

abstract class SO2Event extends Equatable {
  const SO2Event();

  @override
  List<Object> get props => [];
}

class SO2List extends SO2Event {}
