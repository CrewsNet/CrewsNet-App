import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/components/rounded_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final messageController = TextEditingController();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CrewsNET",
                  style: CMainHeading,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Log In",
                  style: CMainSubHeading,
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
                      " Log in with Email ",
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email*",
                  style: CTextStyle,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: CTextFieldDecoration,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Password*",
                  style: CTextStyle,
                ),
                TextField(
                  controller: messageController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: CTextFieldDecoration.copyWith(
                      hintText: "Enter your Password"),
                ),
                Align(
                  alignment: Alignment.center,
                  child: RoundedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/dashboard');
                    },
                    text: "LOG IN",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.lightBlueAccent),
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "©2021 CrewsNet All rights reserved.",
                    style: CCopyrightStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
