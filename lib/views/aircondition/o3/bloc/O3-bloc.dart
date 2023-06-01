import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:czestochowa_app/views/aircondition/c6h6/model/c6h6_model.dart';
import '../model/o3_model.dart';
import '../resources/O3-repository.dart';

part 'O3-event.dart';
part 'O3-state.dart';

class O3Bloc extends Bloc<O3Event, O3State> {
  O3Bloc() : super(O3dInitial()) {
    final O3Repository _O3Repository = O3Repository();

    on<O3List>((event, emit) async {
      try {
        emit(O3Loading());
        final mList = await _O3Repository.fetchO3List();
        emit(O3Loaded(mList));
      } on NetworkError {
        emit(O3Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
