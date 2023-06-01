import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/SO2_model.dart';
import '../resources/SO2-repository.dart';

part 'SO2-event.dart';
part 'SO2-state.dart';

class SO2Bloc extends Bloc<SO2Event, SO2State> {
  SO2Bloc() : super(SO2dInitial()) {
    final SO2Repository _SO2Repository = SO2Repository();

    on<SO2List>((event, emit) async {
      try {
        emit(SO2Loading());
        final mList = await _SO2Repository.fetchSO2List();
        emit(SO2Loaded(mList));
      } on NetworkError {
        emit(SO2Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
