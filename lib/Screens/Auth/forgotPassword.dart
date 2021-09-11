import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:sizer/sizer.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/Utils/auth_validators.dart';
import 'package:crews_net_app/components/Auth/rounded_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with InputValidationMixin {
  Dio dio = Dio();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.3.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                "Forgot Password",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Please Enter E-Mail you used to sign into CrewsNet",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 4.h,
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
                height: 2.h,
              ),
              Align(
                alignment: Alignment.center,
                child: RoundedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    try {
                      Loader.show(
                        context,
                        progressIndicator: CircularProgressIndicator(),
                      );
                      var response = await dio.post(
                        'http://10.0.2.2:8000/users/forgotPassword',
                        data: {
                          'email': emailController.value.text,
                        },
                      );
                      Loader.hide();
                      print(response.statusCode);
                      if (response.statusCode == 200) {
                        Navigator.of(context).pushNamed('/');
                      }
                    } on DioError catch (e) {
                      final error = json.decode(e.response.toString());
                      Loader.hide();
                      final snackBar = SnackBar(
                        backgroundColor: Colors.lightBlue,
                        duration: Duration(seconds: 8),
                        content: Text(
                          error['message'],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  text: "Reset Password",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
