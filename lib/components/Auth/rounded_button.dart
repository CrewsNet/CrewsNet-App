import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.color, required this.onPressed, required this.text});
  final Color color;
  final String text;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.w),
      child: Material(
        elevation: 1.3.w,
        color: color,
        borderRadius: BorderRadius.circular(4.8.h),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 76.w,
          height: 10.w,
          child: Text(
            "$text",
            style: TextStyle(color: Colors.white, fontSize: 13.8.sp),
          ),
        ),
      ),
    );
  }
}