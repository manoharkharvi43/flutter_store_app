import 'package:flutter/material.dart';
import 'package:store_app/screens/main_screens/dashboard/dashboard.dart';
import 'package:store_app/screens/main_screens/home/home.dart';
import 'package:store_app/screens/main_screens/notification/notification.dart';
import 'package:store_app/screens/main_screens/settings/settings.dart';
import 'package:store_app/screens/signin/signin_page.dart';

class Routes {
  static const homePage = "homePage";
  static const notification = "notification";
  static const settings = "settings";
  static const dashboard = "dashboard";
  static const login = "login";

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case Routes.settings:
        return MaterialPageRoute(builder: (context) => const Settings());
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.notification:
        return MaterialPageRoute(builder: (context) => const AppNotification());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (context) => const Dashboard());
      case Routes.login:
        return MaterialPageRoute(builder: (context) =>const SignIn());
      default:
        throw ("No Routes Found");
    }
  }
}
