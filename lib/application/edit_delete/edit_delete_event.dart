part of 'edit_delete_bloc.dart';

class EditDeleteEvent extends Equatable {
  const EditDeleteEvent();

  @override
  List<Object> get props => [];
}

class DeletePostEvent extends EditDeleteEvent {
  DeletePostEvent({required this.imageUrl});
  String imageUrl;
}
