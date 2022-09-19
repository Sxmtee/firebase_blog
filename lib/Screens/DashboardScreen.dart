import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newtutorial/Models/UserModel.dart';
import 'package:newtutorial/Repo/Users_repo.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  UserModel? userModel;
  UserRepo userRepo = UserRepo();
  initUser() async {
    var id = userRepo.checkUser(context);
    userModel = await userRepo.getUser(id);
  }

  @override
  void initState() {
    initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: Icon(Icons.add),
      ),
    );
  }
}
