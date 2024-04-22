import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState(emittingIndex: 0)) {
    on<BottomNavCallEvent>((event, emit) {
      int index = event.currentIndex;
      emit(BottomNavState(emittingIndex: index));
    });
  }
}
