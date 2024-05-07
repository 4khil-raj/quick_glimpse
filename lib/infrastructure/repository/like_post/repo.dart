// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';

class LikePostRepo {
  Future<void> likePost(String imageUrl, String uid) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where('image', isEqualTo: imageUrl)
          .get();
      final postDoc = querySnapshot.docs.first;
      DocumentReference postRef = postDoc.reference;
      await postRef.update({'like': FieldValue.increment(1)});
      await FirebaseFirestore.instance.collection('user_liked').doc().set({
        'image': imageUrl,
        'likedUser': users!.uid,
        'postedUser': uid,
        'LikedUser_dp': users?.profile,
        'LikedUser_name': users?.name,
        'alert': '${users?.name} Liked your Post❤️',
      });

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

  Future<List> likedOrNot() async {
    try {
      List<dynamic> likedList = [];
      final data =

          //use wherecase
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

  Future<void> unlikePost(String image) async {
    final querySnapShot = await FirebaseFirestore.instance
        .collection('user_liked')
        .where('image', isEqualTo: image)
        .get();

    for (var doc in querySnapShot.docs) {
      if (doc['image'] == image && doc['likedUser'] == users!.uid) {
        await doc.reference.delete();
      }
    }
    await dislikePost(image);
  }
}

Future<void> dislikePost(String imageUrl) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('post')
        .where('image', isEqualTo: imageUrl)
        .get();
    final postDoc = querySnapshot.docs.first;
    DocumentReference postRef = postDoc.reference;
    await postRef.update({'like': FieldValue.increment(-1)});
    // return likeCount;
  } catch (e) {
    print(e);
    print('faild to like');
    // return 0;
  }
}
