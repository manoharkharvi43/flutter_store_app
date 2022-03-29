import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/blocs/product_bloc/product_bloc.dart';
import 'package:store_app/repository/product_repository.dart';
import 'package:store_app/screens/main_screens/home/home.dart';
import 'package:store_app/screens/main_screens/notification/notification.dart';
import 'package:store_app/screens/main_screens/settings/settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AppNotification(),
    Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(_selectedIndex),
      body: BlocProvider(
        create: (context) => ProductBloc(
          productRepository: ProductRepo(),
        ) ,
        child: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }

  Widget _bottomNavBar(int selectedIndex) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notifications"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
