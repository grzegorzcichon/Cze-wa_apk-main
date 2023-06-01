part of 'CO-bloc.dart';

abstract class COState extends Equatable {
  COState();

  @override
  List<Object?> get props => [];
}

class COInitial extends COState {}

class COLoading extends COState {}

class COLoaded extends COState {
  final COModel coModel;
  COLoaded(this.coModel);
}

class COError extends COState {
  final String? message;
  COError(this.message);
}
