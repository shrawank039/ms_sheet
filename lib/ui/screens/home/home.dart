import 'package:flutter/material.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/screens/home/pc_main_home.dart';

import '../../../helper/auth_helper.dart';
import '../../../repositories/auth_repository.dart';
import '../../../widgets/bottom_navigation_widget.dart';

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
          // login(context);
          if (constraints.maxWidth < 640) {
            return BottomNavigationWidget();
          } else {
            return const PCHome();
          }
        },
      ),
    );
  }
}

void login(BuildContext context) async {
  var loginResponse =
      await AuthRepository().getLoginResponse('aeimesh@gmail.com', '123456');
  if (loginResponse.success = true) {
    AuthHelper().setUserData(loginResponse);
    print('AuthHelper1 : Bearer ${global.prefs.get('token')}');
  }
}

Widget mobileView() {
  return Container(
    color: Colors.amber,
  );
}
