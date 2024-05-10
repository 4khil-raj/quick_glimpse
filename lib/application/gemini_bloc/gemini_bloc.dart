import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:quick_glimpse/domain/models/gemini/model.dart';
import 'package:quick_glimpse/infrastructure/repository/gemini/repo.dart';

part 'gemini_event.dart';
part 'gemini_state.dart';

class GeminiBloc extends Bloc<GeminiEvent, GeminiState> {
  GeminiBloc() : super(GeminiSuccessState(msg: const [])) {
    on<GeminiNewTextMessageEvent>(geminiNewtextmessageevent);
  }
  List<GeminiModel> geminiMessages = [];
  bool generating = false;

  FutureOr<void> geminiNewtextmessageevent(
      GeminiNewTextMessageEvent event, Emitter<GeminiState> emit) async {
    geminiMessages.add(GeminiModel(
        parts: [GeminiPartModel(text: event.inputMessage)], role: 'user'));
    emit(GeminiSuccessState(msg: geminiMessages));
    generating = true;
    String responseString =
        await GeminiRepo.chatTextGenerationRepo(geminiMessages);

    if (responseString.isNotEmpty) {
      geminiMessages.add(GeminiModel(
          role: 'model', parts: [GeminiPartModel(text: responseString)]));
      emit(GeminiSuccessState(msg: geminiMessages));
    }
    generating = false;
  }
}
