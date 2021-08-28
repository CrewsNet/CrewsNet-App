import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/components/rounded_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agree = false;
  final messageController = TextEditingController();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "CrewsNET",
                style: CMainHeading,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign Up",
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
                style: CTextStyle,
                textAlign: TextAlign.start,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    CTextFieldDecoration.copyWith(hintText: "Enter your name"),
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
                    agree ? Navigator.of(context).pushNamed('/') : null;
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
                  style: CCopyrightStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
