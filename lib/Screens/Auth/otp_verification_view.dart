import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/constants.dart';
import 'package:crews_net_app/components/Auth/rounded_button.dart';
import 'package:sizer/sizer.dart';
import 'package:dio/dio.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpVerification extends StatefulWidget {
  final data;
  OtpVerification({required this.data});
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  Dio dio = Dio();
  final _otpController = TextEditingController();
  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: widget.data["email"], otpLength: 5);
  }

  bool? verify() {
    return (emailAuth.validateOtp(
        recipientMail: widget.data["email"],
        userOtp: _otpController.value.text));
  }

  @override
  initState() {
    super.initState();
    // Add listeners to this class
    sendOtp();
  }

  Widget build(BuildContext context) {
    print(100.sp);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CrewsNET",
                  style:
                      TextStyle(fontSize: 30.5.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "An OTP has been sent to ",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${widget.data["email"]}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: AuthTextFieldDecoration.copyWith(
                      hintText: "Enter OTP",
                      labelText: "OTP",
                      suffix: GestureDetector(
                        child: Text("Resend OTP"),
                        onTap: sendOtp,
                      )),
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RoundedButton(
                    color: Colors.blue,
                    onPressed: () async {
                      bool? isSuccess = verify();
                      if (isSuccess == true) {
                        try {
                          var response = await dio.post(
                            'http://10.0.2.2:8000/api/users/signup',
                            data: widget.data,
                            //     if (response.statusCode == 201) {
                            //   Navigator.of(context).pushNamed('/');
                            // }
                          );
                        } on DioError catch (error) {
                          print(error.message);
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: "OTP verification failed",
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0,
                        );
                      }
                    },
                    text: "Verify",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
