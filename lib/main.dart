import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'ui/screens/home/home.dart';
import 'package:ms_sheet/global.dart' as global;

GlobalKey globalKey = GlobalKey();

void main() async {
  runApp(ProviderScope(child: MsSheet()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  global.getApiHeaders(false);
}

class MsSheet extends StatefulWidget {
  @override
  _MsSheetState createState() => _MsSheetState();
}

class _MsSheetState extends State<MsSheet> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Sizer(
      key: globalKey,
      builder: (context, orientation, deviceType) =>
          //     MaterialApp(
          //   navigatorObservers: [FlutterSmartDialog.observer],
          //   builder: FlutterSmartDialog.init(),
          //   debugShowCheckedModeBanner: false,
          //   theme: ThemeData(fontFamily: 'Poppins'),
          //   home: const Home(),
          // ),
          MaterialApp(
        //navigatorObservers: [FlutterSmartDialog.observer],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          );
        },
        home: const Home(),
      ),
    );
  }
}
