import 'package:bloc/bloc.dart';

import '../../model/districts.dart';

part 'districts_event.dart';
part 'districts_state.dart';

class DistrictsBloc extends Bloc<DistrictsEvent, DistrictsState> {
  DistrictsBloc() : super(DistrictsState()) {
    on<FetchDistrictsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final items = await getItem();
        emit(state.copyWith(items: items, isLoading: false));
      } catch (error) {
        emit(state.copyWith(error: error.toString(), isLoading: false));
      }
    });

    on<ToggleVisibilityEvent>((event, emit) {
      emit(state.copyWith(isVisible: !state.isVisible));
    });
  }

  // Pozostała część klasy...
}


//class DistrictsBloc extends Bloc<DistrictsEvent, DistrictsState> {
 // DistrictsBloc() : super(DistrictsState());

  //Stream<DistrictsState> mapEventToState(DistrictsEvent event) async* {
    //if (event is FetchDistrictsEvent) {
      //yield state.copyWith(isLoading: true);
      //try {
      //  final items = await getItem();
       // yield state.copyWith(items: items, isLoading: false);
      //} catch (error) {
       // yield state.copyWith(error: error.toString(), isLoading: false);
     // }
   // } else if (event is ToggleVisibilityEvent) {
      //yield state.copyWith(isVisible: !state.isVisible);
    //}
 // }
//}