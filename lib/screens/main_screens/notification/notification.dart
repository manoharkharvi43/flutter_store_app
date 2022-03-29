import 'package:flutter/cupertino.dart';

class AppNotification extends StatefulWidget {
  const AppNotification({Key? key}) : super(key: key);

  @override
  State<AppNotification> createState() => _NotificationState();
}

class _NotificationState extends State<AppNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text("Notification")
    );
  }
}
