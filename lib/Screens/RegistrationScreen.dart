import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var emailCtrl = TextEditingController();
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? email, username, password;
  String error_msg = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height / 8),
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 80,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 140,
                        right: 120,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.blueGrey,
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.add_a_photo_rounded),
                          shape: CircleBorder(),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (!emailValid) {
                        return "Invalid Email Address";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: usernameCtrl,
                    decoration: InputDecoration(
                      label: Text("Username"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill This Field";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: passwordCtrl,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Fill This Field";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  child: CircularProgressIndicator(),
                  visible: isLoading,
                ),
                Text(
                  error_msg,
                  style: TextStyle(color: Colors.red),
                ),
                MaterialButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   register();
                    // }
                  },
                  child: Text("Register"),
                  color: Colors.blueGrey,
                  shape: StadiumBorder(),
                  elevation: 10.0,
                  minWidth: 200.0,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
