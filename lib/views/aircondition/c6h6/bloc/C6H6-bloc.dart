import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:czestochowa_app/views/aircondition/c6h6/model/c6h6_model.dart';
import '../resources/C6H6-repository.dart';

part 'C6H6-event.dart';
part 'C6H6-state.dart';

class C6H6Bloc extends Bloc<C6H6Event, C6H6State> {
  C6H6Bloc() : super(C6H6dInitial()) {
    final C6H6Repository _C6H6Repository = C6H6Repository();

    on<GetC6H6List>((event, emit) async {
      try {
        emit(C6H6Loading());
        final mList = await _C6H6Repository.fetchC6H6List();
        emit(C6H6Loaded(mList));
      } on NetworkError {
        emit(C6H6Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
