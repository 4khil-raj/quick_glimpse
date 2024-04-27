class RandomUserModel {
  String bio;
  String email;
  dynamic followers;
  dynamic following;
  String name;
  String? phone;
  dynamic post;
  String profile;

  RandomUserModel(
      {required this.bio,
      required this.email,
      required this.followers,
      required this.following,
      required this.name,
      this.phone,
      required this.post,
      required this.profile});
}
