import 'dart:async';

import 'package:crews_net_app/Screens/Auth/login_view.dart';
import 'package:crews_net_app/Screens/Dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail = "";

class Preloader extends StatefulWidget {
  const Preloader({Key? key}) : super(key: key);

  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  Future getValidationData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedEmail = preferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 1), () {
        finalEmail == null
            ? Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => LoginPage()))
            : Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Dashboard()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
