
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crews_net_app/screens.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputValidationMixin {
  final loginGlobalKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  String email = "";
  String password = "";
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    print(100.sp);
    return  SizerUtil.orientation == Orientation.portrait
            ? MobilePortrait()
            : MobileLandscape();

  }
}
