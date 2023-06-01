part of 'O3-bloc.dart';

abstract class O3State extends Equatable {
  O3State();

  @override
  List<Object?> get props => [];
}

class O3dInitial extends O3State {}

class O3Loading extends O3State {}

class O3Loaded extends O3State {
  final O3Model o3Model;
  O3Loaded(this.o3Model);
}

class O3Error extends O3State {
  final String? message;
  O3Error(this.message);
}
