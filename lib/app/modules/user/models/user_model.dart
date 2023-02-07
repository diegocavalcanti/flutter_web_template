// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String email;

  UserModel({
    required this.name,
    required this.email,
  });

  UserModel copyWith({
    String? name,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
