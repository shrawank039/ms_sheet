import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/screens/home/mobile_main_home.dart';
import 'package:ms_sheet/ui/screens/home/pc_main_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Mobile = Small (smaller than 640px)
          // Tablet = Medium (641px to 1007px)
          // Laptop = Large (1008px and larger)
          if (constraints.maxWidth < 640) {
            return const MobileHome();
          } else {
            return const PCHome();
          }
        },
      ),
    );
  }
}

Widget mobileView() {
  return Container(
    color: Colors.amber,
  );
}
