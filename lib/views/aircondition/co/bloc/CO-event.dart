part of 'CO-bloc.dart';

abstract class COEvent extends Equatable {
  const COEvent();

  @override
  List<Object> get props => [];
}

class GetCOList extends COEvent {}
