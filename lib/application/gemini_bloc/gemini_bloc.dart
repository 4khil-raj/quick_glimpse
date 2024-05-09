import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  GeminiBloc() : super(GeminiInitial()) {
    on<GeminiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
