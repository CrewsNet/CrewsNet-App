import 'package:crews_net_app/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MobileSignuPLandscape extends StatefulWidget {
  const MobileSignuPLandscape({Key? key}) : super(key: key);

  @override
  _MobileSignuPLandscapeState createState() => _MobileSignuPLandscapeState();
}

class _MobileSignuPLandscapeState extends State<MobileSignuPLandscape> with InputValidationMixin {
  final signUpGlobalKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    print(100.sp);
    print(100.w);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key:signUpGlobalKey,
              child: SizedBox(
                height: 100.h,
                width: 80.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.w, ),
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
                        height: 1.2.w,
                      ),
                      Text(
                        "SignUp",
                        style:
                        TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.2.w,
                      ),
                      Text(
                        "Get connected with the world of projects",
                        style: TextStyle(fontSize: 12.5.sp),
                      ),
                      SizedBox(
                        height: 1.2.w,
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
                              Button(imageUrl: "assets/images/google.png",height: 10.h,width: 30.w,),
                              Button(imageUrl: "assets/images/GitHub-Icon.png",height: 10.h,width: 30.w,)
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
                            " Sign up with Email ",
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
                        decoration: AuthTextFieldDecorationLandscape.copyWith(
                            hintText: "Enter your name",labelText: "Name"),
                      ),
                      SizedBox(
                        height: 1.2.h,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale:0.18.h,
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
                              style: TextStyle(color: Colors.white,fontSize: 12.sp),
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
                            "Already have an account? ",style: TextStyle(fontSize: 12.5.sp),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: Colors.lightBlueAccent,fontSize: 12.5.sp),
                              )),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "©2021 CrewsNet All rights reserved.",
                          style: TextStyle(fontSize: 9.sp),
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
