// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/domain/models/comments/model.dart';
import 'package:uuid/uuid.dart';

class CommentsRepo {
  Future<void> addComments(String image, String comments) async {
    await FirebaseFirestore.instance.collection('comments').doc().set({
      'commentId': const Uuid().v1(),
      'commentedUser': users!.uid,
      'image': image,
      'comment': comments,
      'CommenteduserName': users!.name,
      'CommenteduserImage': users!.profile,
      'commentedTime': DateFormat('dd/MM hh:mm a').format(DateTime.now())
    });
  }

  Future<List<CommentModel>> getComments(String image) async {
    List<CommentModel> comments = [];
    try {
      final data = await FirebaseFirestore.instance
          .collection('comments')
          .where('image', isEqualTo: image)
          .get();
      for (var element in data.docs) {
        final comment = element.data();
        CommentModel model = CommentModel(
          commentId: comment['commentId'],
          comment: comment['comment'],
          commentedTime: comment['commentedTime'],
          commentedUser: comment['commentedUser'],
          commentedUserImage: comment['CommenteduserImage'],
          commentedUserName: comment['CommenteduserName'],
          image: comment['image'],
        );
        comments.add(model);
      }
      // Sort the comments list based on commentedTime in descending order (newest first)
      comments.sort((a, b) => b.commentedTime.compareTo(a.commentedTime));
      return comments;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteComment(String uuid) async {
    final querysnapshot = await FirebaseFirestore.instance
        .collection('comments')
        .where('commentId', isEqualTo: uuid)
        .get();

    for (var element in querysnapshot.docs) {
      await element.reference.delete();
    }
  }
}
