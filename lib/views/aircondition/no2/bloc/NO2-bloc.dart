import 'package:bloc/bloc.dart';
import 'package:czestochowa_app/views/aircondition/No2/model/NO2_model.dart';
import 'package:equatable/equatable.dart';

import '../resources/NO2-repository.dart';

part 'NO2-event.dart';
part 'NO2-state.dart';

class NO2Bloc extends Bloc<NO2Event, NO2State> {
  NO2Bloc() : super(NO2Initial()) {
    final NO2Repository _NO2Repository = NO2Repository();

    on<GetNO2List>((event, emit) async {
      try {
        emit(NO2Loading());
        final mList = await _NO2Repository.fetchNO2List();
        emit(NO2Loaded(mList));
      } on NetworkError1 {
        emit(NO2Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
