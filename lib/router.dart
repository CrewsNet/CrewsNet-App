import 'package:crews_net_app/Screens/Auth/login_view.dart';
import 'package:crews_net_app/Screens/preloader.dart';
import 'package:flutter/material.dart';

import 'Screens/Auth/otp_verification_view.dart';
import 'Screens/Auth/signup_view.dart';
import 'Screens/Dashboard/dashboard_view.dart';
import 'Screens/PageNotFound.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Preloader());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => Dashboard());
      default:
        return MaterialPageRoute(builder: (_) => PageNotFound());
    }
  }
}
