import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/main.dart';
import 'package:second_capstone/screens/home_screen.dart';
import 'package:second_capstone/screens/login_screen.dart';
import 'package:second_capstone/screens/register_account_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const SecondCapstone());
      case '/loginScreen':
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case '/registerAccountScreen':
        return CupertinoPageRoute(builder: (_) => const RegisterAccountScreen());
      case '/homeScreen':
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error Page'),
          ),
        );
      },
    );
  }
}
