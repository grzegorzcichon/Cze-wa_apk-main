part of 'C6H6-bloc.dart';

abstract class C6H6State extends Equatable {
  C6H6State();

  @override
  List<Object?> get props => [];
}

class C6H6dInitial extends C6H6State {}

class C6H6Loading extends C6H6State {}

class C6H6Loaded extends C6H6State {
  final C6H6Model c6h6Model;
  C6H6Loaded(this.c6h6Model);
}

class C6H6Error extends C6H6State {
  final String? message;
  C6H6Error(this.message);
}
