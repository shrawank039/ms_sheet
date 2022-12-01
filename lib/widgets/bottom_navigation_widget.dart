/*
* File : Bottom Navigation widget
* Version : 1.0.0
* Description :
* */

import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/screens/home/mobile_main_home.dart';
import 'package:ms_sheet/ui/screens/home/pages/settings.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> screens() => [
        MobileHome(),
        Settings(),
        Settings(),
        Settings(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens().elementAt(_currentIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        clipBehavior: Clip.none,
        child: Container(
          height: 80,
          child: BottomNavigationBar(
            /*----------- Build Bottom Navigation Tab here ---------------*/
            currentIndex: _currentIndex,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(color: Colors.grey),
            selectedItemColor: Colors.black,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: onTapped,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Image.asset(
                  "assets/home.png",
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(153, 153, 153, 1),
                  height: 20,
                ),
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                label: 'Location',
                tooltip: 'Location',
                icon: Image.asset(
                  "assets/categories.png",
                  color: _currentIndex == 1
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(153, 153, 153, 1),
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Bookings',
                tooltip: 'Bookings',
                icon: Image.asset(
                  "assets/booking.png",
                  color: _currentIndex == 3
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(153, 153, 153, 1),
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Image.asset(
                    "assets/profile.png",
                    color: _currentIndex == 4
                        ? Theme.of(context).colorScheme.secondary
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  tooltip: 'Profile')
            ],
          ),
        ),
      ),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
