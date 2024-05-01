import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/application/bottm_nav_bloc/bottom_nav_bloc.dart';
import 'package:quick_glimpse/application/timeline_bloc/timeline_bloc.dart';

class SavePostRepo {
  Future<void> savepostRequest(
      TimeLineLoadSuccessState value, int index) async {
    await FirebaseFirestore.instance.collection('saved_post').doc().set({
      'image': value.timeline[index].image,
      'uid': value.timeline[index].uid,
      'name': value.timeline[index].username,
      'userprofile': value.timeline[index].userImage,
      'caption': value.timeline[index].caption,
      'like': 0,
      'time': value.timeline[index].time,
      'currentUser': users!.uid
    });
  }

  Future<List> checkSaved() async {
    try {
      List<dynamic> savedlist = [];
      final data =
          await FirebaseFirestore.instance.collection('saved_post').get();
      for (var element in data.docs) {
        final theUser = element.data();
        savedlist.add(theUser['currentUser']);
        savedlist.add(theUser['image']);
      }
      return savedlist;
    } catch (e) {
      return [];
    }
  }

  Future<void> removeSave(TimeLineLoadSuccessState imageUrl, int index) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('saved_post')
          .where('image', isEqualTo: imageUrl.timeline[index].image)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
