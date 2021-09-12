import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/Utils/auth_validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/components/Auth/rounded_button.dart';
import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  Dio dio = Dio();
  bool agree = false;
  bool _obscureText = true;
  final signUpGlobalKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: signUpGlobalKey,
              child: SizedBox(
                height: 90.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.only(top: 2.h, left: 2.5.w, right: 2.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UpperAuth(
                          Usertext: "SignUp with Email", pageType: "Sign Up"),
                      SizedBox(
                        height:2.h,
                      ),
                      Validation(
                        passwordController: passwordController,
                        nameController: nameController,
                        isNameField: true,
                        emailController: emailController,
                        obscureText: _obscureText,
                      ),
                      SizedBox(
                        height: 1.2.h,
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
                                "I have read and accept terms and conditions",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RoundedButton(
                          color: agree ? Colors.blue : Colors.grey,
                          onPressed: () async {
                            final snackBar = SnackBar(
                              backgroundColor: Colors.lightBlue,
                              duration: Duration(seconds: 5),
                              content: Text(
                                "Attempting to create account",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            if (agree &&
                                signUpGlobalKey.currentState!.validate()) {
                              signUpGlobalKey.currentState!.save();
                              try {
                                Loader.show(
                                  context,
                                  progressIndicator:
                                      CircularProgressIndicator(),
                                );
                                var response = await dio.post(
                                    'http://10.0.2.2:8000/users/signup',
                                    data: {
                                      'name': nameController.value.text,
                                      'email': emailController.value.text,
                                      'password': passwordController.value.text,
                                    });
                                Loader.hide();

                                final text =
                                    "Verify account using link send to ${emailController.value.text}";
                                final snackBar = SnackBar(
                                  duration: Duration(seconds: 15),
                                  content: Text(
                                    text,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.lightBlue,
                                );
                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                                print(response);
                              } on DioError catch (e) {
                                print(e);
                                Loader.hide();
                                final error =
                                    json.decode(e.response.toString());
                                print(error['error']['code'].runtimeType);
                                if (error['error']['code'] == 11000) {
                                  final snackBar2 = SnackBar(
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.lightBlue,
                                    content: Text(
                                      "An account with the registered E-Mail exists",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(snackBar2);
                                } else {
                                  final snackBar2 = SnackBar(
                                    duration: Duration(seconds: 5),
                                    backgroundColor: Colors.lightBlue,
                                    content: Text(
                                      "Error occurred! Try again later",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(snackBar2);
                                }
                              }
                            }
                          },
                          text: "SIGN UP",
                        ),
                      ),
                      AuthBottom(context: context,NothavingAccount: false)
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
