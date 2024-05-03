import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/domain/models/comments/model.dart';

class CommentsRepo {
  Future<void> addComments(String image, String comments) async {
    await FirebaseFirestore.instance.collection('comments').doc().set({
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
}
