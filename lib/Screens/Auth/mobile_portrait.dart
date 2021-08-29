import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/screens.dart';
class MobilePortrait extends StatefulWidget {
  const MobilePortrait({Key? key}) : super(key: key);

  @override
  _MobilePortraitState createState() => _MobilePortraitState();
}

class _MobilePortraitState extends State<MobilePortrait> with InputValidationMixin {
  final loginGlobalKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  String email = "";
  String password = "";
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    print(100.sp);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Form(
            key: loginGlobalKey,
            child: SizedBox(
              height: 94.h,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.3.w),
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
                        borderRadius: BorderRadius.circular(2.5.h),

                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.w),
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
                      onFieldSubmitted: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: AuthTextFieldDecorationLandscape,
                    ),
                    SizedBox(
                      height: 1.2.h,
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
                      decoration: AuthTextFieldDecorationLandscape.copyWith(
                          labelText: "Password",hintText: "Enter your Password"),
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
                                onChanged: (value) {
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
                        onPressed: () {
                          if (loginGlobalKey.currentState!.validate()) {
                            loginGlobalKey.currentState!.save();
                            Navigator.of(context).pushNamed('/dashboard');
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
                                  color: Colors.lightBlueAccent, fontSize: 11.sp),
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
    );
  }
}
