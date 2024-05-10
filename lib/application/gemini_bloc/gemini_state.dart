// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'gemini_bloc.dart';

@immutable
sealed class GeminiState {}

final class GeminiInitial extends GeminiState {}

class GeminiSuccessState extends GeminiState {
  final List<GeminiModel> msg;
  GeminiSuccessState({
    required this.msg,
  });
}
