class TimelineModel {
  String image;
  String caption;
  int like;
  String username;
  String userImage;
  String uid;
  dynamic time;
  TimelineModel(
      {required this.caption,
      required this.time,
      required this.image,
      required this.like,
      required this.uid,
      required this.userImage,
      required this.username});
}
