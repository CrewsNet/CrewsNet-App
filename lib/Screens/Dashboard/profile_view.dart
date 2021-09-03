import 'package:crews_net_app/Screens/Dashboard/drawer.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DashDrawer(),
    );
  }
}
