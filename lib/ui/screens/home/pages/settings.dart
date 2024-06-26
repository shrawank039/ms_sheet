import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/ui/screens/home/pages/settings/add_assistant.dart';
import 'package:ms_sheet/ui/screens/home/pages/settings/add_sheets.dart';
import 'package:ms_sheet/ui/screens/login/profile_screen.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:sizer/sizer.dart';
import 'package:ms_sheet/global.dart' as global;
import '../../login/otp_page.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool assistant = false;
  late FToast fToast;
  @override
  void initState() {
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
    return Expanded(
      child: Column(
        children: [
          topBar(),
          SizedBox(
            height: 3.w,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              top: 2.w, bottom: 1.8.w, right: 1.w),
                          decoration:
                              DesignConfig.boxDecorationContainerCardShadow(
                                  ColorsRes.white,
                                  const Color.fromRGBO(44, 39, 46, 0.059),
                                  16.0,
                                  3,
                                  3,
                                  20,
                                  0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 1.0.w, right: 1.w),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        hoverColor: Colors.transparent,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: ColorsRes.darkGrey,
                                          size: 2.8.w,
                                        )),
                                    Text(
                                      'Settings',
                                      style: TextStyle(
                                          color: ColorsRes.darkGrey,
                                          fontSize: 2.0.w),
                                    ),
                                    const Spacer(),
                                    Card(
                                      margin: EdgeInsets.only(left: 2.w),
                                      color: ColorsRes.lightBlue,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.5.w)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 0.7.h,
                                            bottom: 0.7.h,
                                            left: 1.8.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 0.1.w,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.wallet,
                                              color: ColorsRes.mainBlue,
                                              size: 2.5.w,
                                            ),
                                            SizedBox(
                                              width: 1.0.h,
                                            ),
                                            Text(
                                              "2300",
                                              style: TextStyle(
                                                color: ColorsRes.mainBlue,
                                                fontSize: 2.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.5.w,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.w,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: userDetails(context),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 3.w,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            assistant = false;
                          });
                        },
                        child: settingButtons(Icons.create_new_folder,
                            'Add Sheet', 'Create and edit sheets'),
                      ),
                      SizedBox(
                        height: 1.5.w,
                      ),
                      InkWell(
                        onTap: () {
                          if (global.prefs.get('type') == 'admin') {
                          setState(() {
                            assistant = true;
                          });
                           }else{
                            _showToast('You don\'t have permission.');
                          }
                        },
                        child: settingButtons(Icons.create_new_folder,
                            'Add Assistant', 'Create and edit assistant'),
                      ),
                      SizedBox(
                        height: 1.5.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        },
                        child: settingButtons(Icons.login, 'Login Details',
                            'Change you login details or logout'),
                      ),
                      SizedBox(
                        height: 1.5.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Otp(
                                      '',
                                      '${global.prefs.get('mobile_number')}',
                                      '',
                                      'pass')));
                        },
                        child: settingButtons(Icons.password, 'Change Password',
                            'Change you password'),
                      ),
                      SizedBox(
                        height: 1.5.w,
                      ),
                      settingButtons(Icons.mobile_friendly, 'Recharge',
                          'Create and Recharge your wallet'),
                      SizedBox(
                        height: 1.5.w,
                      ),
                      settingButtons(
                          Icons.mobile_friendly, 'About Us', 'Check About Us'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                assistant ? const AddAssistant() : const AddSheets(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widgets -----------------------------------------------------------------------------------------------------------------------------------------------------------------

Widget topBar() {
  return Row(
    children: [
      SizedBox(
        width: 1.5.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Khata',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
          ),
          Text(
            'Wallet section',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 1.4.w,
              color: Color.fromARGB(255, 155, 155, 155),
            ),
          )
        ],
      ),
      Expanded(child: Container()),
      Card(
        margin: EdgeInsets.only(left: 2.w),
        color: Color(0xfff9f9f9),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.5.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 1.8.w),
          child: Row(
            children: [
              Text(
                'Select Sheet',
                style: TextStyle(color: ColorsRes.darkGrey, fontSize: 1.7.w),
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      Card(
        margin: EdgeInsets.only(left: 2.w),
        color: ColorsRes.mainBlue,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.5.w)),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 2.2.w),
            child: Text(
              'Create',
              style: TextStyle(color: ColorsRes.white, fontSize: 1.7.w),
            )),
      ),
    ],
  );
}

Widget userDetails(BuildContext context) {
  return Row(
    children: [
      SizedBox(
        width: 0.5.w,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(2.2.w),
        child: Image.network(
          'https://cdn-icons-png.flaticon.com/256/149/149071.png',
          height: 7.w,
          width: 7.w,
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
      ),
      Expanded(
        child: SizedBox(
          width: 2.w,
        ),
      ),
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          icon: Icon(
            Icons.create,
            size: 2.5.w,
            color: ColorsRes.darkGrey,
          ))
    ],
  );
}

Widget settingButtons(IconData icon, String title, String subtitle) {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.0.w, vertical: 1.0.w),
          decoration: DesignConfig.boxDecorationContainerCardShadow(
              ColorsRes.white,
              Color.fromRGBO(44, 39, 46, 0.059),
              16,
              3,
              3,
              20,
              0),
          child: Row(
            children: [
              Card(
                color: ColorsRes.mainBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.6.w),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.5.w),
                  child: Icon(
                    icon,
                    color: ColorsRes.white,
                    size: 2.5.w,
                  ),
                ),
              ),
              SizedBox(
                width: 1.3.w,
              ),
              Padding(
                padding: EdgeInsets.all(0.5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 1.85.w,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(
                      height: 0.3.w,
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 1.3.w,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              Card(
                color: ColorsRes.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 2.w,
                    color: Color(0xFFBEC4E3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget transactionList(String? pic, String? name, String? date) {
  return Container(
    margin: EdgeInsets.only(top: 1.w),
    decoration: DesignConfig.boxDecorationContainerCardShadow(
        ColorsRes.white, Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 1.w),
      child: Row(
        children: [
          SizedBox(
            width: 0.5.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              pic!,
              height: 5.5.w,
              width: 5.5.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Padding(
            padding: EdgeInsets.all(1.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 1.7.w,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  date!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 1.3.w,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(0.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₹650',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 2.w,
                      fontWeight: FontWeight.w600,
                      color: ColorsRes.green),
                ),
                Text(
                  'Credited',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 1.3.w,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBold.arrow_right_circle,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}
