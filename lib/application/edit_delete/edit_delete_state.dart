part of 'edit_delete_bloc.dart';

sealed class EditDeleteState extends Equatable {
  const EditDeleteState();

  @override
  List<Object> get props => [];
}

final class EditDeleteInitial extends EditDeleteState {}

class LoadingState extends EditDeleteState {}

class EventSuccessState extends EditDeleteState {}

class EventErrorState extends EditDeleteState {
  EventErrorState({required this.msg});
  String msg;
}
