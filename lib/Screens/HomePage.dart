import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            Center(
                              child: Text("Upload An Image"),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            )));
  }
}
