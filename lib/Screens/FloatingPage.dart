import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FloatingPage extends StatefulWidget {
  const FloatingPage({Key? key}) : super(key: key);

  @override
  State<FloatingPage> createState() => _FloatingPageState();
}

class _FloatingPageState extends State<FloatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              InkWell(
                  onTap: () {},
                  child: Card(
                    shape: StadiumBorder(),
                    elevation: 10,
                    child: Container(
                      height: 200,
                      child: Center(
                        child: Text("Upload An Image"),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  maxLength: 50,
                  minLines: 8,
                  maxLines: 8,
                  decoration: InputDecoration(
                      labelText: "Body",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)))),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Submit"),
                color: Colors.blue,
                shape: StadiumBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
