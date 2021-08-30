import 'package:flutter/material.dart';
import 'package:crews_net_app/screens.dart';

class Button extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double height;
  final double width;

  const Button({
    Key? key,
    this.title = "",
    this.imageUrl = "",
    this.height = 0.0,
    this.width = 0.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent),
        minimumSize: MaterialStateProperty.all(Size(20.w, 5.4.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.7.h),
          ),
        ),
        backgroundColor:
        MaterialStateProperty.all(Color.fromRGBO(71, 71, 71, 1)),
      ),
      onPressed: () {},
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: this.width,
          height: this.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Image.asset(
                  this.imageUrl,
                  width: 12.7.w,
                  height: 12.7.w,
                ),
              ),
              Text(
                this.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.7.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}