import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hometab_event.dart';
part 'hometab_state.dart';

class HometabBloc extends Bloc<HometabEvent, HometabState> {
  HometabBloc() : super(HometabState()) {
    on<TabChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });
  }
}
