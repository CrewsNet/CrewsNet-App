import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Button extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final Color color;


  const Button(
      {Key? key,
      required this.imageUrl,
      required this.height,
      required this.width,
      required this.color,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(this.color),
        minimumSize: MaterialStateProperty.all(Size(20.w, 5.4.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.7.h),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(Color.fromRGBO(71, 71, 71, 1)),
      ),
      onPressed: (){},
      child: Container(
        width: this.width,
        height: this.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              this.imageUrl,
              width: 12.7.w,
              height: 12.7.w,
            ),
            // Text(
            //   this.title,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w500,
            //     fontSize: 13.7.sp,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
