import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/Utils/auth_validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with InputValidationMixin {
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
            ],
          ),
        ),
      ),
    );
  }
}
