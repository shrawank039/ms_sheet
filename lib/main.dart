import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sizer/sizer.dart';

import 'ui/screens/home/home.dart';

void main() {
  runApp(MsSheet());
}

class MsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        home: const Home(),
      ),
    );
  }
}
