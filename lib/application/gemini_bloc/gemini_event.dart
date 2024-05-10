part of 'gemini_bloc.dart';

@immutable
sealed class GeminiEvent {}

class GeminiNewTextMessageEvent extends GeminiEvent {
  GeminiNewTextMessageEvent({
    required this.inputMessage,
  });

  final String inputMessage;
}
