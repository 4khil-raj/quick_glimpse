class LikeCommentModel {
  String alert;
  String useruId;
  String? comment;
  String username;
  String image;
  String userdp;
  LikeCommentModel(
      {required this.alert,
      required this.userdp,
      required this.image,
      this.comment,
      required this.username,
      required this.useruId});
}
