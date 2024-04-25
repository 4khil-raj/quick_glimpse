class CurrentUserModel {
  String? name;
  String? phone;
  String? email;
  String? profile;
  String? uid;
  String? bio;
  var following;
  var followers;
  var post;

  CurrentUserModel(
      {this.name,
      this.email,
      this.phone,
      this.profile,
      this.bio,
      this.uid,
      this.followers,
      this.following,
      this.post});
}
