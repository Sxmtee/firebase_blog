import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, email, password, username, image_url;
  UserModel(
      {required this.email,
      required this.id,
      required this.password,
      required this.username,
      required this.image_url});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        email: doc["email"],
        id: doc["id"],
        password: doc["password"],
        username: doc["username"],
        image_url: doc["image_url"]);
  }
}
