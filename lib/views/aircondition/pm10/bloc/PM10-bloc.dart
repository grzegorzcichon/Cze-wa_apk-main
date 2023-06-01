import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/pm10_model.dart';
import '../resources/PM-repository.dart';

part 'PM10-event.dart';
part 'PM10-state.dart';

class PM10Bloc extends Bloc<PM10Event, PM10State> {
  PM10Bloc() : super(PM10Initial()) {
    final PM10Repository _PM10Repository = PM10Repository();

    on<GetPM10List>((event, emit) async {
      try {
        emit(PM10Loading());
        final mList = await _PM10Repository.fetchPM10List();
        emit(PM10Loaded(mList));
      } on NetworkError {
        emit(PM10Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
