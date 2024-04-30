import 'package:cloud_firestore/cloud_firestore.dart';

class EditAndDeleteRepo {
  Future<void> deletePost(imageUrl) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where('image', isEqualTo: imageUrl)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
