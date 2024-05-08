import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/domain/models/alerts/followers_model.dart';
import 'package:quick_glimpse/domain/models/alerts/like_comment.dart';

class AlertsRepo {
  Future<List<FollowersModel>> getFollowers() async {
    List<FollowersModel> followers = [];
    try {
      final querySnapshort = await FirebaseFirestore.instance
          .collection('Follow')
          .where('followed_user', isEqualTo: users?.uid)
          .get();
      for (var element in querySnapshort.docs) {
        FollowersModel model = FollowersModel(
            uid: element['follower'],
            name: element['follower_name'],
            profile: element['follower_dp']);
        followers.add(model);
      }
      return followers;
    } catch (e) {
      return [];
    }
  }

  Future<List<LikeCommentModel>> getLikeAndComment() async {
    List<LikeCommentModel> likecomment = [];

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('user_liked')
          .where('postedUser', isEqualTo: users?.uid)
          .get();
      for (var element in querySnapshot.docs) {
        LikeCommentModel model = LikeCommentModel(
            image: element['image'],
            alert: element['alert'],
            userdp: element['LikedUser_dp'],
            username: element['LikedUser_name'],
            useruId: element['likedUser']);
        likecomment.add(model);
      }
      final commentQuerySnapshot = await FirebaseFirestore.instance
          .collection('comments')
          .where('postedUser', isEqualTo: users?.uid)
          .get();
      for (var element in commentQuerySnapshot.docs) {
        LikeCommentModel model = LikeCommentModel(
            image: element['image'],
            alert: element['alert'],
            userdp: element['CommenteduserImage'],
            username: element['CommenteduserName'],
            useruId: element['commentedUser']);
        likecomment.add(model);
      }

      return likecomment.reversed.toList();
    } catch (e) {
      print('elseelellelele');
      return [];
    }
  }
}
