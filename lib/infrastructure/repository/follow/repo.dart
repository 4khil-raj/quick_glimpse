import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';

class FollowRepo {
  Future<void> follow(String userUid) async {
    print(users!.uid);
    await FirebaseFirestore.instance.collection('Follow').doc().set({
      'followed_user': userUid,
      'follower': users!.uid,
      'follower_dp': users!.profile,
      'follower_name': users!.name
    });
    checkFollow();
    increseFollow(userUid, false);
  }

  Future<void> increseFollow(String userUid, bool decrease) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Profile')
          .where('uid', isEqualTo: userUid)
          .get();

      final profileDoc = querySnapshot.docs.first;
      DocumentReference profileRef = profileDoc.reference;
      decrease
          ? await profileRef.update({'followers': FieldValue.increment(-1)})
          : await profileRef.update({'followers': FieldValue.increment(1)});
    } catch (e) {
      print('someerror on update');
    }
  }

  Future<List> checkFollow() async {
    final List followers = [];

    final querySnapshot = await FirebaseFirestore.instance
        .collection('Follow')
        .where('follower', isEqualTo: users!.uid)
        .get();
    for (var i in querySnapshot.docs) {
      final checker = i.data();
      followers.add(checker['followed_user']);
      followers.add(checker['follower']);
    }
    return followers;
  }

  Future<void> unFollow(String userUid) async {
    increseFollow(userUid, true);
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Follow')
        .where('followed_user', isEqualTo: userUid)
        .get();
    querySnapshot.docs.forEach((element) {
      element.reference.delete();
    });
  }
}
