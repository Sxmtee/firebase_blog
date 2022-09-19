import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newtutorial/Models/UserModel.dart';
import 'package:newtutorial/Screens/LoginScreen.dart';

class UserRepo {
  Future<UserModel> getUser(String id) async {
    var userDocument =
        await FirebaseFirestore.instance.collection("blogUser").doc(id).get();
    UserModel userModel = UserModel.fromDocument(userDocument);
    return userModel;
  }

  String checkUser(BuildContext context) {
    var id = FirebaseAuth.instance.currentUser!.uid;
    if (id != null) {
      return id;
    } else {
      var route = MaterialPageRoute(builder: (BuildContext) => LoginScreen());
      Navigator.push(context, route);

      return "No User";
    }
  }
}
