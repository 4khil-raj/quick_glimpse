class CommentModel {
  String commentedUser;
  String image;
  String comment;
  String commentedUserName;
  String commentedUserImage;
  String commentedTime;
  String commentId;

  CommentModel(
      {required this.comment,
      required this.commentId,
      required this.commentedTime,
      required this.commentedUser,
      required this.commentedUserImage,
      required this.commentedUserName,
      required this.image});
}
