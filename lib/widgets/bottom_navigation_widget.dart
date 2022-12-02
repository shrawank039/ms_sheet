import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/screens/home/mobile_main_home.dart';
import 'package:ms_sheet/ui/screens/home/pages/settings.dart';
import 'package:ms_sheet/ui/screens/home/pages/share_history.dart';

import '../ui/screens/home/pages/Counters.dart';

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
        Counters(),
        ShareHistory(),
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
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.secondary),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: onTapped,
            items: [
              BottomNavigationBarItem(
                label: 'Local',
                icon: Image.asset(
                  "assets/home.png",
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(153, 153, 153, 1),
                  height: 20,
                ),
                tooltip: 'Local',
              ),
              BottomNavigationBarItem(
                label: 'Counter',
                tooltip: 'Counter',
                icon: Image.asset(
                  "assets/categories.png",
                  color: _currentIndex == 1
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(153, 153, 153, 1),
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Share',
                tooltip: 'Share',
                icon: Image.asset(
                  "assets/booking.png",
                  color: _currentIndex == 2
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(153, 153, 153, 1),
                  height: 20,
                ),
              ),
              BottomNavigationBarItem(
                  label: 'Settings',
                  icon: Image.asset(
                    "assets/profile.png",
                    color: _currentIndex == 3
                        ? Theme.of(context).colorScheme.secondary
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  tooltip: 'Settings')
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
