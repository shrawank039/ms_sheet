import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/ui/screens/home/pages/agents.dart';
import 'package:ms_sheet/ui/screens/home/pages/sheets.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../styles/design.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({super.key});

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  String currentPage = 'Sheets';
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    currentPage = 'Sheets';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: ColorsRes.lightWeightColor,
      padding: EdgeInsets.only(
        left: 2.w,
        top: 2.w,
        right: 2.w,
        bottom: 2.w,
      ),
      // decoration: DesignConfig.boxDecorationContainerCardShadow(ColorsRes.white,
      //     const Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.2.h),
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
                userDetails(),
                SizedBox(
                  height: 2.w,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentPage = 'Sheets';
                              controller = PageController(initialPage: 0);
                            });
                          },
                          child: (currentPage == 'Sheets')
                              ? ActiveTab(
                                  icon: IconlyBold.category, pageName: 'Sheets')
                              : nonActiveTab(
                                  icon: IconlyBold.category,
                                  pageName: 'Sheets')),
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentPage = 'Agents';
                              controller = PageController(initialPage: 1);
                            });
                          },
                          child: (currentPage == 'Agents')
                              ? ActiveTab(
                                  icon: IconlyBold.user_2, pageName: 'Agents')
                              : nonActiveTab(
                                  icon: IconlyLight.user, pageName: 'Agents')),
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentPage = 'Wallet';
                              controller = PageController(initialPage: 2);
                            });
                          },
                          child: (currentPage == 'Wallet')
                              ? ActiveTab(
                                  icon: IconlyBold.wallet, pageName: 'Khata')
                              : nonActiveTab(
                                  icon: IconlyBroken.wallet,
                                  pageName: 'Khata')),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                /// Use [Axis.vertical] to scroll vertically.
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    if (value == 0) {
                      currentPage = 'Sheets';
                    } else if (value == 1) {
                      currentPage = 'Agents';
                    } else if (value == 2) {
                      currentPage = 'Wallet';
                    }
                  });
                },
                children: <Widget>[
                  Sheets(),
                  Agents(),
                  Center(
                    child: Container(child: Text('Third Page')),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

Widget userDetails() {
  return Row(
    children: [
      SizedBox(
        width: 0.5.w,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(6.w),
        child: Image.network(
          'https://t4.ftcdn.net/jpg/02/24/86/95/360_F_224869519_aRaeLneqALfPNBzg0xxMZXghtvBXkfIA.jpg',
          height: 10.w,
          width: 10.w,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        width: 1.w,
      ),
      Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aeimesh',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              '+91 854662548',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 2.8.w,
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

Widget ActiveTab({required IconData icon, required String pageName}) {
  return Card(
    color: ColorsRes.lightBlue,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ColorsRes.mainBlue,
            size: 5.5.w,
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Text(
            pageName,
            style: TextStyle(
              color: ColorsRes.mainBlue,
              fontSize: 3.5.w,
            ),
          )
        ],
      ),
    ),
  );
}

Widget nonActiveTab({required IconData icon, required String pageName}) {
  return Card(
    color: ColorsRes.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.w)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ColorsRes.darkGrey,
            size: 5.5.w,
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Text(
            pageName,
            style: TextStyle(
              color: ColorsRes.darkGrey,
              fontSize: 3.5.w,
            ),
          )
        ],
      ),
    ),
  );
}
