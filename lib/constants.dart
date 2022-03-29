// import 'package:flutter/cupertino.dart';
//
// class AppConstants extends InheritedWidget {
//   static AppConstants ? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<AppConstants>();
//   const AppConstants({required Widget  child, Key ? key}): super(key: key, child: child);
//   final  String ? SIGN_IN = 'Log In';
//   @override
//   bool updateShouldNotify(AppConstants oldWidget) => false;
//
// }


import 'package:flutter/cupertino.dart';

class AppConstants {
  static const loginButtonName = "Log in";
}

class AppColors {
  static const Color loginButtonColor = Color(0x005A9C);
}

class AppPlaceHolder {
  static const  emailAddress = "Email";
  static const password = "Password";
  static const phoneNumber = "Phone-Number";
}
