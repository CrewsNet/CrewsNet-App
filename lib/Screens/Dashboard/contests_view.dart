import 'package:flutter/material.dart';

import 'drawer.dart';

class Contests extends StatelessWidget {
  const Contests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DashDrawer(),
    );
  }
}