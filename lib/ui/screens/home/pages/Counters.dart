import 'package:flutter/material.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/player_limit_popup.dart';
import 'package:sizer/sizer.dart';

class Counters extends StatefulWidget {
  @override
  State<Counters> createState() => _SheetsState();
}

class _SheetsState extends State<Counters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(),
        SizedBox(
          height: 4.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: global.agents.map((e) {
                return agentsList(e.picture, e.name, e.date, context);
              }).toList(),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 1.w),
                padding: EdgeInsets.all(1.5.w),
                decoration: DesignConfig.boxDecorationContainerCardShadow(
                    ColorsRes.white,
                    Color.fromRGBO(44, 39, 46, 0.059),
                    16.0,
                    3,
                    3,
                    20,
                    0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Enter agent name',
                              Icons.person,
                              3.w,
                              TextInputType.name),
                        ),
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Enter mobile number',
                              Icons.mobile_friendly,
                              3.w,
                              TextInputType.phone),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Pair rate',
                              Icons.monetization_on,
                              3.w,
                              TextInputType.number),
                        ),
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'In out rate',
                              Icons.monetization_on,
                              3.w,
                              TextInputType.number),
                        ),
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Commission',
                              Icons.monetization_on,
                              3.w,
                              TextInputType.number),
                        ),
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Patti',
                              Icons.pattern,
                              3.w,
                              TextInputType.number),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Card(
                          margin: EdgeInsets.only(right: 1.w),
                          color: ColorsRes.mainBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.6.w)),
                          child: Container(
                            height: 7.w,
                            width: 30.w,
                            alignment: Alignment.center,
                            child: Text(
                              'Add',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsRes.white, fontSize: 2.w),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
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
            'Counters',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
          ),
          Text(
            'Created by you',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 1.3.w,
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

Widget agentsList(
    String? pic, String? name, String? date, BuildContext context) {
  return Container(
    width: 50.w,
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: ColorsRes.red,
              size: 3.w,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => PlayerLimitPopup(name, pic, date));
            },
            icon: Icon(
              Icons.edit_note,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}
