import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/co_model.dart';
import '../resources/CO-repository.dart';

part 'CO-event.dart';
part 'CO-state.dart';

class COBloc extends Bloc<COEvent, COState> {
  COBloc() : super(COInitial()) {
    final CORepository _CORepository = CORepository();

    on<GetCOList>((event, emit) async {
      try {
        emit(COLoading());
        final mList = await _CORepository.fetchCOList();
        emit(COLoaded(mList));
      } on NetworkError1 {
        emit(COError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
