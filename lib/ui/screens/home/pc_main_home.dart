import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/ui/screens/home/pages/Counters.dart';
import 'package:ms_sheet/ui/screens/home/pages/agents.dart';
import 'package:ms_sheet/ui/screens/home/pages/assistants.dart';
import 'package:ms_sheet/ui/screens/home/pages/khata.dart';
import 'package:ms_sheet/ui/screens/home/pages/local_players.dart';
import 'package:ms_sheet/ui/screens/home/pages/settings.dart';
import 'package:ms_sheet/ui/screens/home/pages/share_history.dart';
import 'package:ms_sheet/ui/screens/home/pages/sheets.dart';
import 'package:ms_sheet/ui/screens/home/pages/sheets_history.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:sizer/sizer.dart';
import 'package:ms_sheet/global.dart' as global;
import '../../styles/design.dart';

class PCHome extends StatefulWidget {
  const PCHome({super.key});

  @override
  State<PCHome> createState() => _PCHomeState();
}

class _PCHomeState extends State<PCHome> {
  String currentPage = 'Sheets';
  late FToast fToast;

  @override
  void initState() {
    currentPage = 'Sheets';
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  _showToast(String text) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(3.2.w),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MS SHEET',
                        style: TextStyle(
                            fontSize: 2.5.w, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'PVT LTD',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 1.5.w,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.8.h,
                ),
                global.prefs != null ? userDetails(currentPage) : Container(),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.2.h),
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  width: 30.w,
                  decoration: DesignConfig.boxDecorationContainerCardShadow(
                      ColorsRes.white,
                      Color.fromRGBO(44, 39, 46, 0.059),
                      12.0,
                      3,
                      3,
                      20,
                      0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              currentPage = 'Sheets';
                            });
                          },
                          child: (currentPage == 'Sheets')
                              ? Card(
                                  color: ColorsRes.lightBlue,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.w)),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          IconlyBold.category,
                                          color: ColorsRes.mainBlue,
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        Text(
                                          'Sheets',
                                          style: TextStyle(
                                            color: ColorsRes.mainBlue,
                                            fontSize: 1.7.w,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Card(
                                  color: ColorsRes.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.w)),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          IconlyLight.category,
                                          color: ColorsRes.darkGrey,
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        Text(
                                          'Sheets',
                                          style: TextStyle(
                                            color: ColorsRes.darkGrey,
                                            fontSize: 1.7.w,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (global.prefs.get('type') == 'admin') {
                            setState(() {
                              currentPage = 'Clients';
                            });
                          }else{
                            _showToast('You don\'t have permission.');
                          }
                        },
                        child: (currentPage == 'Clients')
                            ? Card(
                                color: ColorsRes.lightBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.w)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconlyBold.user_2,
                                        color: ColorsRes.mainBlue,
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      Text(
                                        'Clients',
                                        style: TextStyle(
                                          color: ColorsRes.mainBlue,
                                          fontSize: 1.7.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                color: ColorsRes.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.w)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconlyLight.user,
                                        color: ColorsRes.darkGrey,
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      Text(
                                        'Clients',
                                        style: TextStyle(
                                          color: ColorsRes.darkGrey,
                                          fontSize: 1.7.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage = 'Wallet';
                          });
                        },
                        child: (currentPage == 'Wallet')
                            ? Card(
                                color: ColorsRes.lightBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.w)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 0.1.w,
                                      ),
                                      const Icon(
                                        IconlyBold.wallet,
                                        color: ColorsRes.mainBlue,
                                      ),
                                      SizedBox(
                                        width: 1.9.w,
                                      ),
                                      Text(
                                        'Khata',
                                        style: TextStyle(
                                          color: ColorsRes.mainBlue,
                                          fontSize: 1.7.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                color: ColorsRes.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.w)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 0.1.w,
                                      ),
                                      const Icon(
                                        IconlyBroken.wallet,
                                        color: ColorsRes.darkGrey,
                                      ),
                                      SizedBox(
                                        width: 1.9.w,
                                      ),
                                      Text(
                                        'Khata',
                                        style: TextStyle(
                                          color: ColorsRes.darkGrey,
                                          fontSize: 1.7.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (global.prefs.get('type') == 'admin') {
                          setState(() {
                            currentPage = 'Assistants';
                          });
                           }else{
                            _showToast('You don\'t have permission.');
                          }
                        },
                        child: (currentPage == 'Assistants')
                            ? Card(
                                color: ColorsRes.lightBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.w)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconlyBold.user_2,
                                        color: ColorsRes.mainBlue,
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      Text(
                                        'Assistants',
                                        style: TextStyle(
                                          color: ColorsRes.mainBlue,
                                          fontSize: 1.7.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Card(
                                color: ColorsRes.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.w)),
                                child: Padding(
                                  padding: EdgeInsets.all(1.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconlyLight.user,
                                        color: ColorsRes.darkGrey,
                                      ),
                                      SizedBox(
                                        width: 1.5.w,
                                      ),
                                      Text(
                                        'Assistants',
                                        style: TextStyle(
                                          color: ColorsRes.darkGrey,
                                          fontSize: 1.7.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //sheets section
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (global.prefs.get('type') == 'admin') {
                          setState(() {
                            currentPage = 'Chats';
                          });
                           }else{
                            _showToast('You don\'t have permission.');
                          }
                        },
                        child: (currentPage == 'Chats')
                            ? DesignConfig.flatButtonWithIcon(
                                ColorsRes.mainBlue,
                                1.4.w,
                                FontAwesomeIcons.peopleGroup,
                                ColorsRes.white,
                                2.0.w,
                                'Chats',
                                1.6.w,
                                ColorsRes.white,
                              )
                            : DesignConfig.flatButtonWithIcon(
                                ColorsRes.lightWeightColor,
                                1.4.w,
                                FontAwesomeIcons.peopleGroup,
                                ColorsRes.mainBlue,
                                2.0.w,
                                'Chats',
                                1.6.w,
                                ColorsRes.mainBlue,
                              ),
                      ),
                      /*GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage = 'Counters';
                          });
                        },
                        child: (currentPage == 'Counters')
                            ? DesignConfig.flatButtonWithIcon(
                                ColorsRes.mainBlue,
                                1.4.w,
                                FontAwesomeIcons.flag,
                                ColorsRes.white,
                                2.0.w,
                                'Counters',
                                1.6.w,
                                ColorsRes.white,
                              )
                            : DesignConfig.flatButtonWithIcon(
                                ColorsRes.lightWeightColor,
                                1.4.w,
                                FontAwesomeIcons.flag,
                                ColorsRes.mainBlue,
                                2.0.w,
                                'Counters',
                                1.6.w,
                                ColorsRes.mainBlue,
                              ),
                      ),*/
                      /*GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage = 'Share History';
                          });
                        },
                        child: (currentPage == 'Share History')
                            ? DesignConfig.flatButtonWithIcon(
                                ColorsRes.mainBlue,
                                1.4.w,
                                FontAwesomeIcons.history,
                                ColorsRes.white,
                                2.0.w,
                                'Share History',
                                1.6.w,
                                ColorsRes.white,
                              )
                            : DesignConfig.flatButtonWithIcon(
                                ColorsRes.lightWeightColor,
                                1.4.w,
                                FontAwesomeIcons.history,
                                ColorsRes.mainBlue,
                                2.0.w,
                                'Share History',
                                1.6.w,
                                ColorsRes.mainBlue,
                              ),
                      ),*/
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage = 'Sheets History';
                          });
                        },
                        child: (currentPage == 'Sheets History')
                            ? DesignConfig.flatButtonWithIcon(
                                ColorsRes.mainBlue,
                                1.4.w,
                                FontAwesomeIcons.history,
                                ColorsRes.white,
                                2.0.w,
                                'Sheets History',
                                1.6.w,
                                ColorsRes.white,
                              )
                            : DesignConfig.flatButtonWithIcon(
                                ColorsRes.lightWeightColor,
                                1.4.w,
                                FontAwesomeIcons.history,
                                ColorsRes.mainBlue,
                                2.0.w,
                                'Sheets History',
                                1.6.w,
                                ColorsRes.mainBlue,
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                        //  if (global.prefs.get('type') == 'admin') {
                          setState(() {
                            currentPage = 'Settings';
                          });
                          //  }else{
                          //   _showToast('You don\'t have permission.');
                          // }
                        },
                        child: (currentPage == 'Settings')
                            ? DesignConfig.flatButtonWithIcon(
                                ColorsRes.mainBlue,
                                1.4.w,
                                Icons.settings,
                                ColorsRes.white,
                                2.0.w,
                                'Settings',
                                1.6.w,
                                ColorsRes.white,
                              )
                            : DesignConfig.flatButtonWithIcon(
                                ColorsRes.lightWeightColor,
                                1.4.w,
                                Icons.settings,
                                ColorsRes.mainBlue,
                                2.0.w,
                                'Settings',
                                1.6.w,
                                ColorsRes.mainBlue,
                              ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Icon(
                        Icons.notifications_outlined,
                        color: ColorsRes.darkGrey,
                        size: 3.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  if (currentPage == 'Sheets') ...[
                    hiding(),
                    Sheets(),
                  ] else if (currentPage == 'Clients') ...[
                    hiding(),
                    Agents(),
                  ] else if (currentPage == 'Wallet') ...[
                    hiding(),
                    Wallet(),
                  ] else if (currentPage == 'Assistants') ...[
                    hiding(),
                    Assistants(),
                  ] else if (currentPage == 'Chats') ...[
                    hiding(),
                    LocalPlayers(),
                  ] else if (currentPage == 'Counters') ...[
                    hiding(),
                    Counters(),
                  ] else if (currentPage == 'Share History') ...[
                    hiding(),
                    ShareHistory(),
                  ] else if (currentPage == 'Settings') ...[
                    hiding(),
                    Settings(),
                  ] else if (currentPage == 'Sheets History') ...[
                    hiding(),
                    SheetsHistory(),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget userDetails(String currentPage) {
  return Row(
    children: [
      SizedBox(
        width: 0.5.w,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          'https://cdn-icons-png.flaticon.com/256/149/149071.png',
          height: 6.w,
          width: 6.w,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${global.prefs.get('name')}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 2.w,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              '${global.prefs.get('mobile_number')}',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 1.5.w,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

//Side Menu Widget

Widget hiding() {
  return Column(
    children: [
      Visibility(
        child: Sheets(),
        visible: false,
      ),
      Visibility(
        child: Wallet(),
        visible: false,
      ),
      Visibility(
        child: Agents(),
        visible: false,
      ),
      Visibility(
        child: LocalPlayers(),
        visible: false,
      ),
      Visibility(
        child: ShareHistory(),
        visible: false,
      ),
      Visibility(
        child: Counters(),
        visible: false,
      ),
      Visibility(
        child: Settings(),
        visible: false,
      ),
      Visibility(
        child: SheetsHistory(),
        visible: false,
      )
    ],
  );
}
