class UserModel {
  final String email;
  final String password;
  final String id;

  UserModel({required this.email, required this.password, required this.id});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'id': id};
  }
}
