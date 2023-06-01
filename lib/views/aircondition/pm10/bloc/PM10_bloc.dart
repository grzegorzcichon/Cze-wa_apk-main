import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:czestochowa_app/views/aircondition/c6h6/model/c6h6_model.dart';
import '../model/NO2_model.dart';
import '../resources/NO2_repository.dart';

part 'NO2_event.dart';
part 'NO2_state.dart';

class PM10Bloc extends Bloc<NO2Event, NO2State> {
  PM10Bloc() : super(NO2dInitial()) {
    final NO2Repository _NO2Repository = NO2Repository();

    on<NO2List>((event, emit) async {
      try {
        emit(NO2Loading());
        final mList = await _NO2Repository.fetchNO2List();
        emit(NO2Loaded(mList));
      } on NetworkError {
        emit(NO2Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
