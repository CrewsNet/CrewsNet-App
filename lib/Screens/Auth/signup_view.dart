import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/screens.dart';


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
      body: Center(
        child: Form(
          key: signUpGlobalKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 90.h,
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "CrewsNET",
                      style:
                          TextStyle(fontSize: 30.5.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Text(
                      "Get connected with the world of projects",
                      style: TextStyle(fontSize: 11.45.sp),
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.4.h),

                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(imageUrl: "assets/images/google.png",height: 9.h,width: 23.w,),
                            Button(imageUrl: "assets/images/GitHub-Icon.png",height: 9.h,width: 23.w,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 0.18.h,
                          ),
                        ),
                        Text(
                          " Sign up with Email ",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 0.18.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.2.h,
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
                          hintText: "Enter your name",labelText: "Name"),
                    ),
                    SizedBox(
                      height: 1.2.h,
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
                          hintText: "Enter your Password",labelText: "Password"),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Transform.scale(
                            scale:0.23.w,
                            child: Checkbox(
                              activeColor: Colors.blueGrey,
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = !agree;
                                });
                              },
                            ),
                          ),
                          Text(
                            "I have read and accept terms and conditions",
                            style: TextStyle(color: Colors.white,fontSize: 10.sp),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
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
                          "Already have an account? ",style: TextStyle(fontSize: 11.sp),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.lightBlueAccent,fontSize: 11.sp),
                            )),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "©2021 CrewsNet All rights reserved.",
                        style: TextStyle(fontSize: 7.63.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
