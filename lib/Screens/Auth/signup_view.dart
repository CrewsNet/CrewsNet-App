
import 'package:crews_net_app/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with InputValidationMixin {
  bool agree = false;
  final signUpGlobalKey = GlobalKey<FormState>();
  final messageController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return  SizerUtil.orientation == Orientation.portrait
        ? MobileSignuPPortrait()
        : MobileSignuPLandscape();
  }
}
