import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Utils/auth_validators.dart';
import 'components/Auth/Button.dart';

Column AuthBottom({BuildContext? context, bool? NothavingAccount}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NothavingAccount!
              ? Text(
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 11.sp),
                )
              : Text(
                  "Already have an Account? ",
                  style: TextStyle(fontSize: 11.sp),
                ),
          GestureDetector(
            onTap: () {
              NothavingAccount!
                  ? Navigator.pushNamed(context!, '/signup')
                  : Navigator.pushNamed(context!, '/');
            },
            child: NothavingAccount!
                ? Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 11.sp),
                  )
                : Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 11.sp),
                  ),
          ),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          "©2021 CrewsNet All rights reserved.",
          style: TextStyle(fontSize: 8.sp),
        ),
      ),
    ],
  );
}

class Validation extends StatefulWidget {
  Validation(
      {Key? key,
      this.obscureText = false,
      this.nameController,
      this.isNameField,
      this.emailController,
      this.passwordController})
      : super(key: key);

  @override
  State<Validation> createState() => _ValidationState();
  bool obscureText;

  final TextEditingController? nameController;

  final bool? isNameField;

  final TextEditingController? emailController;

  final TextEditingController? passwordController;
}

class _ValidationState extends State<Validation> with InputValidationMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isNameField!
            ? TextFormField(
                validator: (name) {
                  if (isNameValid(name!))
                    return null;
                  else
                    return 'Enter a valid name';
                },
                controller: widget.nameController,
                textAlign: TextAlign.center,
                decoration: AuthTextFieldDecoration.copyWith(
                    hintText: "Enter your name", labelText: "Name"),
              )
            : Container(),
        SizedBox(
          height:2.h,
        ),
        TextFormField(
          validator: (email) {
            if (isEmailValid(email!))
              return null;
            else
              return 'Enter a valid email address';
          },
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          textAlign: TextAlign.center,
          decoration: AuthTextFieldDecoration,
        ),
        SizedBox(
          height:2.h,
        ),
        TextFormField(
          validator: (password) {
            if (isPasswordValid(password!))
              return null;
            else
              return 'Enter a valid password';
          },
          controller: widget.passwordController,
          obscureText: widget.obscureText,
          textAlign: TextAlign.center,
          decoration: AuthTextFieldDecoration.copyWith(
            labelText: "Password",
            hintText: "Enter your Password",
            suffixIcon: IconButton(
              icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget UpperAuth({String? pageType, String? Usertext}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "CrewsNet",
        style: TextStyle(fontSize: 30.5.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 2.h,
      ),
      Text(
        pageType.toString(),
        style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 2.h,
      ),
      Text(
        "Get connected with the world of projects",
        style: TextStyle(fontSize: 11.45.sp),
      ),
      SizedBox(
        height: 2.h,
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
                onPressed: () {},
                imageUrl: "assets/images/google.png",
                height: 9.h,
                width: 23.w,
                color: Colors.yellow,
              ),
              Button(
                onPressed: () {},
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
        height: 2.h,
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
            Usertext.toString(),
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
    ],
  );
}

var AuthTextFieldDecoration = InputDecoration(
  labelText: "Email",
  labelStyle: TextStyle(fontSize: 15.sp),
  errorStyle: TextStyle(fontSize: 10.sp),
  hintText: "Enter your email",
  hintStyle: TextStyle(fontSize: 10.sp),
  contentPadding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 2.5.h),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(2.5.h),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(2.5.h),
    ),
    borderSide: BorderSide(
      color: Colors.lightBlue,
      width: 0.4.w,
    ),
  ),
);

// Hello
