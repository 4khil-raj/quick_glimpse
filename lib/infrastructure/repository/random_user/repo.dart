// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/domain/models/random_user/model.dart';
import 'package:quick_glimpse/domain/models/timeline/model.dart';

class RandomUserRepo {
  Future<List<RandomUserModel>> findRandomUser(String email) async {
    List<RandomUserModel> randomuser = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Profile')
          .where('uid', isEqualTo: email)
          .get();

      querySnapshot.docs.forEach((element) {
        RandomUserModel model = RandomUserModel(
            uid: element['uid'],
            bio: element['bio'],
            email: element['email'],
            followers: element['followers'],
            following: element['following'],
            name: element['name'],
            // phone: element['phone'],
            post: element['post'],
            profile: element['profile_pic']);
        randomuser.add(model);
      });
      return randomuser;
    } catch (e) {
      return [];
    }
  }

  Future<List<TimelineModel>> getRandomUserPosts(String uid) async {
    List<TimelineModel> posts = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where('uid', isEqualTo: uid)
          .get();
      querySnapshot.docs.forEach((element) {
        TimelineModel model = TimelineModel(
            caption: element['caption'],
            time: element['time'],
            image: element['image'],
            like: element['like'],
            uid: element['uid'],
            userImage: element['userprofile'],
            username: element['name']);
        posts.add(model);
      });
      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<List<TimelineModel>> getSavedPost(String currentUid) async {
    List<TimelineModel> savedItems = [];
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('saved_post')
          .where('currentUser', isEqualTo: currentUid)
          .get();
      querySnapshot.docs.forEach((element) {
        TimelineModel model = TimelineModel(
            caption: element['caption'],
            time: element['time'],
            image: element['image'],
            like: element['like'],
            uid: element['uid'],
            userImage: element['userprofile'],
            username: element['name']);
        savedItems.add(model);
      });
      return savedItems;
    } catch (e) {
      return [];
    }
  }
}
