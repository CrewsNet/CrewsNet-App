import 'package:crews_net_app/Screens/Auth/login_view.dart';

import 'package:flutter/material.dart';

import 'Screens/Auth/signup_view.dart';
import 'Screens/Dashboard/contests_view.dart';
import 'Screens/Dashboard/dashboard_view.dart';
import 'Screens/Dashboard/profile_view.dart';
import 'Screens/Dashboard/project_view.dart';
import 'Screens/Dashboard/saved_view.dart';
import 'Screens/PageNotFound.dart';
import 'package:crews_net_app/Screens/Auth/forgotPassword.dart';

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
      case '/projects':
        return MaterialPageRoute(builder: (_) => Project());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/contests':
        return MaterialPageRoute(builder: (_) => Contests());
      case '/forgot':
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case '/saved':
        return MaterialPageRoute(builder: (_) => Saved());
      default:
        return MaterialPageRoute(builder: (_) => PageNotFound());
    }
  }
}
