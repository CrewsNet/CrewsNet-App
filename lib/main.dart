import 'package:crews_net_app/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'WorkSans',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'WorkSans',
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/signup',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
