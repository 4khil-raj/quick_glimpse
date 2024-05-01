part of 'save_post_bloc.dart';

sealed class SavePostState extends Equatable {
  const SavePostState();

  @override
  List<Object> get props => [];
}

final class SavePostInitial extends SavePostState {}

class SaveSuccessState extends SavePostState {
  List done;
  SaveSuccessState({required this.done});
}

class SaveErrorState extends SavePostState {
  String msg;
  SaveErrorState({required this.msg});
}
