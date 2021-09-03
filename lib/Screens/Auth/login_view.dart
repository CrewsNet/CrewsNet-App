import 'dart:async';
import 'dart:convert';

import 'package:crews_net_app/Screens/Dashboard/dashboard_view.dart';
import 'package:crews_net_app/Utils/auth_validators.dart';
import 'package:crews_net_app/components/Auth/Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/components/Auth/rounded_button.dart';

import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail = "";
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputValidationMixin {
  Dio dio = Dio();
  final loginGlobalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool agree = false;
  bool _obscureText = true;

  @override
  @override
  Widget build(BuildContext context) {
    // print(100.sp);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: loginGlobalKey,
              child: SizedBox(
                height: 90.h,
                width: 100.w,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CrewsNET",
                        style: TextStyle(
                            fontSize: 30.5.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 23.sp, fontWeight: FontWeight.bold),
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
                          borderRadius: BorderRadius.circular(3.5.h),
                          color: Color.fromRGBO(71, 71, 71, 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Button(
                                imageUrl: "assets/images/google.png",
                                height: 9.h,
                                width: 23.w,
                                color: Colors.yellow,
                              ),
                              Button(
                                imageUrl: "assets/images/GitHub-Icon.png",
                                height: 9.h,
                                width: 23.w,
                                color: Colors.redAccent,
                              )
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
                              thickness: 0.4.w,
                            ),
                          ),
                          Text(
                            " Log in with Email ",
                            style: TextStyle(fontSize: 13.sp),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 0.4.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextFormField(
                        validator: (email) {
                          if (isEmailValid(email!))
                            return null;
                          else
                            return 'Enter a valid email address';
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: AuthTextFieldDecoration,
                      ),
                      SizedBox(
                        height: 1.2.h,
                      ),
                      TextFormField(
                        validator: (password) {
                          if (isPasswordValid(password!))
                            return null;
                          else
                            return 'Enter a valid password';
                        },
                        controller: passwordController,
                        obscureText: _obscureText,
                        textAlign: TextAlign.center,
                        decoration: AuthTextFieldDecoration.copyWith(
                          labelText: "Password",
                          hintText: "Enter your Password",
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Transform.scale(
                                scale: 0.23.w,
                                child: Checkbox(
                                  activeColor: Colors.blueGrey,
                                  value: agree,
                                  onChanged: (value) async {
                                    final SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    preferences.setString(
                                        'email', emailController.text);

                                    setState(() {
                                      agree = !agree;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Remember Me",
                                style: TextStyle(fontSize: 10.3.sp),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(fontSize: 10.3.sp),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RoundedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            if (loginGlobalKey.currentState!.validate()) {
                              loginGlobalKey.currentState!.save();
                              try {
                                var response = await dio.post(
                                  'http://10.0.2.2:8000/api/users/login',
                                  data: {
                                    'email': emailController.value.text,
                                    'password': passwordController.value.text,
                                  },
                                  options: Options(
                                    followRedirects: false,
                                  ),
                                );
                                if (response.statusCode == 200) {
                                  Navigator.of(context).pushNamed('/dashboard');
                                }
                              } on DioError catch (e) {
                                final error = json.decode(e.response.toString());
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.lightBlue,
                                  duration: Duration(seconds: 8),
                                  content: Text(
                                    error['message'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          text: "LOG IN",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 11.sp),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 11.sp),
                              )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "©2021 CrewsNet All rights reserved.",
                          style: TextStyle(fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class Preloader extends StatefulWidget {
  const Preloader({Key? key}) : super(key: key);

  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  Future getValidationData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedEmail = preferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 1), () {
        finalEmail == null
            ? Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()))
            : Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Dashboard()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}