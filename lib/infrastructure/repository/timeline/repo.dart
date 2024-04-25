import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_glimpse/domain/models/timeline/model.dart';

class TimelineRepo {
  Future<List<TimelineModel>> getTimeline() async {
    List<TimelineModel> timelines = [];
    try {
      final data = await FirebaseFirestore.instance.collection('post').get();
      for (var element in data.docs) {
        final theUser = element.data();

        TimelineModel model = TimelineModel(
            caption: theUser['caption'],
            image: theUser['image'],
            like: theUser['like'],
            uid: theUser['uid'],
            userImage: theUser['userprofile'],
            username: theUser['name']);
        timelines.add(model);
      }

      return timelines;
    } catch (e) {
      print(e.toString());
    }
    return timelines;
  }
}
