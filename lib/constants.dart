import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

var AuthTextFieldDecoration = InputDecoration(
  labelText: "Email",
  labelStyle: TextStyle(fontSize: 15.sp),
  errorStyle: TextStyle(fontSize: 10.sp),
  hintText: "Enter your email",
  hintStyle: TextStyle(fontSize:10.sp ),
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

