import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newtutorial/Screens/RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String? email, password;
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
                Container(
                  margin: EdgeInsets.only(top: size.height / 6),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [Image.asset("assets/Image/logillu.png")],
                  ),
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
                    //   login();
                    // }
                  },
                  child: Text("Login"),
                  color: Colors.blueGrey,
                  shape: StadiumBorder(),
                  elevation: 10.0,
                  minWidth: 200.0,
                  height: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do Not Have An Account ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          var route = MaterialPageRoute(
                              builder: (context) => RegistrationScreen());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
