// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';

class LikePostRepo {
  Future<void> likePost(String imageUrl) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where('image', isEqualTo: imageUrl)
          .get();
      final postDoc = querySnapshot.docs.first;
      DocumentReference postRef = postDoc.reference;
      await postRef.update({'like': FieldValue.increment(1)});
      // final likeCount = postDoc.data()['like'];
      // print(likeCount);
      await FirebaseFirestore.instance
          .collection('user_liked')
          .doc()
          .set({'image': imageUrl, 'likedUser': users!.uid});
      print('Post liked successfully!');
      // return likeCount;
    } catch (e) {
      print(e);
      print('faild to like');
      // return 0;
    }
  }

  Future<int> getLikecount(String imageUrl) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('post')
        .where('image', isEqualTo: imageUrl)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final postDoc = querySnapshot.docs.first;
      final likeCount = postDoc.data()['like'];
      return likeCount;
    }
    return 0;
  }

  Future<List> likedOrNot(String imageUrl) async {
    try {
      List<dynamic> likedList = [];
      final data =
          await FirebaseFirestore.instance.collection('user_liked').get();

      for (var element in data.docs) {
        final theUser = element.data();
        if (users!.uid == theUser['likedUser']) {
          likedList.add(theUser['likedUser']);
          likedList.add(theUser['image']);
        }
      }
      return likedList;
    } catch (e) {
      return [];
    }
  }

  Future<void> unlikePost() async {}
}
