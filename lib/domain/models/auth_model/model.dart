class UserModel {
  String? email;
  String? password;
  String? uid;
  String? name;
  String? phone;

  UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    this.uid,
  });
}
