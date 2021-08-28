import 'package:crews_net_app/Utils/auth_validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/components/Auth/rounded_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  bool agree = false;
  final signUpGlobalKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Form(
        key: signUpGlobalKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "CrewsNET",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign Up",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Get connected with the world of projects",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF323232),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/GitHub-Icon.png",
                              height: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.5,
                        ),
                      ),
                      Text(
                        " Sign up with Email ",
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Name*",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  TextFormField(
                    validator: (name) {
                      if (isNameValid(name!))
                        return null;
                      else
                        return 'Enter a valid name';
                    },
                    onFieldSubmitted: (value) {
                      name = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: AuthTextFieldDecoration.copyWith(
                        hintText: "Enter your name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email*",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      email = value;
                    },
                    validator: (email) {
                      if (isEmailValid(email!))
                        return null;
                      else
                        return 'Enter a valid email address';
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: AuthTextFieldDecoration,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Password*",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      password = value;
                    },
                    validator: (password) {
                      if (isPasswordValid(password!))
                        return null;
                      else
                        return 'Enter a valid password';
                    },
                    controller: messageController,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: AuthTextFieldDecoration.copyWith(
                        hintText: "Enter your Password"),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.blueGrey,
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree = !agree;
                          });
                        },
                      ),
                      Text(
                        "I have read and accept terms and conditions",
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RoundedButton(
                      color: agree ? Colors.blue : Colors.grey,
                      onPressed: () {
                        if (agree && signUpGlobalKey.currentState!.validate()) {
                          signUpGlobalKey.currentState!.save();
                          Navigator.of(context).pushNamed('/');
                        }
                      },
                      text: "SIGN UP",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.lightBlueAccent),
                          )),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "©2021 CrewsNet All rights reserved.",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
