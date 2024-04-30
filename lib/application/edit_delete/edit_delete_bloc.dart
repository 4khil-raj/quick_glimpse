import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/infrastructure/repository/edit_delete/repository.dart';

part 'edit_delete_event.dart';
part 'edit_delete_state.dart';

class EditDeleteBloc extends Bloc<EditDeleteEvent, EditDeleteState> {
  EditDeleteBloc() : super(EditDeleteInitial()) {
    on<EditDeleteEvent>((event, emit) {
      emit(EditDeleteInitial());
    });
    on<DeletePostEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await EditAndDeleteRepo().deletePost(event.imageUrl);
        emit(EventSuccessState());
      } on FirebaseException catch (e) {
        emit(EventErrorState(msg: e.message.toString()));
      }
    });
  }
}
