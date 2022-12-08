import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/khata_entry_popup.dart';
import 'package:sizer/sizer.dart';

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _SheetsState();
}

class _SheetsState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(),
        SizedBox(
          height: 3.w,
        ),
        body(context)
      ],
    );
  }
}

// Widgets -----------------------------------------------------------------------------------------------------------------------------------------------------------------
Widget body(BuildContext context) {
  bool mobile = MediaQuery.of(context).size.width < 640;

  return mobile == true
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 1.w),
                    padding: EdgeInsets.only(top: 4.w, bottom: 2.w),
                    decoration: DesignConfig.boxDecorationContainerCardShadow(
                        ColorsRes.white,
                        const Color.fromRGBO(44, 39, 46, 0.059),
                        16.0,
                        3,
                        3,
                        20,
                        0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '1750.00',
                                    style: TextStyle(
                                        color: ColorsRes.mainBlue,
                                        fontFamily: 'Spartan',
                                        fontSize: 3.w,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 1.w,
                                  ),
                                  Text(
                                    'In Amount',
                                    style: TextStyle(
                                      color: Color(0xFF979FC6),
                                      fontSize: 2.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 5.w,
                              width: 1,
                              color: ColorsRes.greyLightColor,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '1200.00',
                                    style: TextStyle(
                                        color: ColorsRes.green,
                                        fontFamily: 'Spartan',
                                        fontSize: 3.w,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 1.w,
                                  ),
                                  Text(
                                    'Out Amount',
                                    style: TextStyle(
                                      color: Color(0xFF979FC6),
                                      fontSize: 2.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 2.2.w),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(1.2.w)),
                                  color: Color(0xFFf9f9f9),
                                  elevation: 0,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.w),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'View Reports',
                                      style:
                                          TextStyle(color: ColorsRes.mainBlue),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 3.w,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          showDialog(
                              context: context,
                              builder: (context) => KhataEntryPopup());
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.6.w, vertical: 1.5.w),
                          decoration:
                              DesignConfig.boxDecorationContainerCardShadow(
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.w),
                                  child: Text(
                                    '₹',
                                    style: TextStyle(
                                        fontSize: 2.5.w,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
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
                                      'Create New Entry',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 1.9.w,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    Text(
                                      'Daily Entry',
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
                                color: ColorsRes.lightBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.w),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 2.5.w,
                                        color: ColorsRes.mainBlue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 3.w,
            ),
            Column(
              children: global.agents.map((e) {
                return transactionList(e.picture, e.name, e.date);
              }).toList(),
            ),
          ],
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 1.w),
                      padding: EdgeInsets.only(top: 4.w, bottom: 2.w),
                      decoration: DesignConfig.boxDecorationContainerCardShadow(
                          ColorsRes.white,
                          const Color.fromRGBO(44, 39, 46, 0.059),
                          16.0,
                          3,
                          3,
                          20,
                          0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '1750.00',
                                      style: TextStyle(
                                          color: ColorsRes.mainBlue,
                                          fontFamily: 'Spartan',
                                          fontSize: 3.w,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    Text(
                                      'In Amount',
                                      style: TextStyle(
                                        color: Color(0xFF979FC6),
                                        fontSize: 2.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 5.w,
                                width: 1,
                                color: ColorsRes.greyLightColor,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '1200.00',
                                      style: TextStyle(
                                          color: ColorsRes.green,
                                          fontFamily: 'Spartan',
                                          fontSize: 3.w,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    Text(
                                      'Out Amount',
                                      style: TextStyle(
                                        color: Color(0xFF979FC6),
                                        fontSize: 2.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.w,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.2.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.2.w)),
                                    color: Color(0xFFf9f9f9),
                                    elevation: 0,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.w),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'View Reports',
                                        style: TextStyle(
                                            color: ColorsRes.mainBlue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 3.w,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (() {
                            showDialog(
                                context: context,
                                builder: (context) => KhataEntryPopup());
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.6.w, vertical: 1.5.w),
                            decoration:
                                DesignConfig.boxDecorationContainerCardShadow(
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.w),
                                    child: Text(
                                      '₹',
                                      style: TextStyle(
                                          fontSize: 2.5.w,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Create New Entry',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 1.9.w,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      Text(
                                        'Daily Entry',
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
                                  color: ColorsRes.lightBlue,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.w),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.w),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 2.5.w,
                                          color: ColorsRes.mainBlue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Column(
                    children: global.agents.map((e) {
                      return transactionList(e.picture, e.name, e.date);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        );
}

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