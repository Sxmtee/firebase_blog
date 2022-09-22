import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newtutorial/Models/UserModel.dart';
import 'package:newtutorial/Repo/Users_repo.dart';
import 'package:newtutorial/Screens/FloatingPage.dart';
import 'package:newtutorial/Screens/HomePage.dart';
import 'package:newtutorial/Screens/ProfilePage.dart';

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

  List<Widget> items = [HomePage(), ProfilePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SxmteePro"),
        centerTitle: true,
      ),
      body: items[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.lightBlue[100],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          var route =
              MaterialPageRoute(builder: (BuildContext) => FloatingPage());
          Navigator.push(context, route);
        }),
        child: Icon(Icons.add),
      ),
    );
  }
}
