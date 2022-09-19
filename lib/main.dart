import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newtutorial/Screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class newTutorial extends StatefulWidget {
  const newTutorial({Key? key}) : super(key: key);

  @override
  State<newTutorial> createState() => _newTutorialState();
}

class _newTutorialState extends State<newTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
