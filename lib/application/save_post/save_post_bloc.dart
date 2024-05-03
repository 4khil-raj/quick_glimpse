import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';
import 'package:quick_glimpse/infrastructure/repository/save_post/repo.dart';

part 'save_post_event.dart';
part 'save_post_state.dart';

class SavePostBloc extends Bloc<SavePostEvent, SavePostState> {
  SavePostBloc() : super(SavePostInitial()) {
    // on<SavePostEvent>((event, emit) {
    //   emit(SavePostInitial());
    // });

    on<SavePostRequestEvent>((event, emit) async {
      try {
        await SavePostRepo().savepostRequest(event.value, event.index);
        final done = await SavePostRepo().checkSaved();
        emit(SaveSuccessState(done: done));
      } on FirebaseException catch (e) {
        emit(SaveErrorState(msg: e.message.toString()));
      }
    });

    on<SaveCheckingEvent>((event, emit) async {
      final done = await SavePostRepo().checkSaved();
      emit(SaveSuccessState(done: done));
    });

    on<RemoveSavedPostEvent>((event, emit) async {
      await SavePostRepo().removeSave(event.state, event.index);
      final done = await SavePostRepo().checkSaved();
      emit(SaveSuccessState(done: done));
    });
  }
}
