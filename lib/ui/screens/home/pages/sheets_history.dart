import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/data/models/agents_model.dart';
import 'package:ms_sheet/ui/screens/panels/main_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:sizer/sizer.dart';

class SheetsHistory extends StatefulWidget {
  @override
  State<SheetsHistory> createState() => _SheetsHistoryState();
}

class _SheetsHistoryState extends State<SheetsHistory> {
  final List<AgentsModel> agents = [
    AgentsModel(
      id: '1',
      name: 'Sheet 1',
      date: DateTime.now(),
      picture:
          'https://play-lh.googleusercontent.com/2MmaqnAOoKUMtoJYqCa91T7rlHIM9Smj-TSdXHEvv9IQf--UfEGUhZmriGrpZ6PmTg',
    ),
    AgentsModel(
      id: '2',
      name: 'Sheet 2',
      date: DateTime.now(),
      picture:
          'https://play-lh.googleusercontent.com/2MmaqnAOoKUMtoJYqCa91T7rlHIM9Smj-TSdXHEvv9IQf--UfEGUhZmriGrpZ6PmTg',
    ),
    AgentsModel(
      id: '3',
      name: 'Sheet 3',
      date: DateTime.now(),
      picture:
          'https://play-lh.googleusercontent.com/2MmaqnAOoKUMtoJYqCa91T7rlHIM9Smj-TSdXHEvv9IQf--UfEGUhZmriGrpZ6PmTg',
    ),
    AgentsModel(
      id: '4',
      name: 'Sheet 4',
      date: DateTime.now(),
      picture:
          'https://play-lh.googleusercontent.com/2MmaqnAOoKUMtoJYqCa91T7rlHIM9Smj-TSdXHEvv9IQf--UfEGUhZmriGrpZ6PmTg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(),
        SizedBox(
          height: 2.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: agents.map((e) {
                  return sheetsList(e.picture, e.name, e.date, context);
                }).toList(),
              ),
            ),
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
            'Sheets History',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
          ),
          Text(
            'Your Team',
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

Widget sheetsList(
    String? pic, String? name, DateTime? date, BuildContext context) {
  return Container(
    // width: 50.w,
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
                  'Created On: 20 oct, 2022',
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
          // Image.asset(
          //   'assets/icons/pin.png',
          //   height: 3.w,
          //   width: 3.w,
          // ),
          SizedBox(
            width: 4.w,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPanel(),
                  ));
            },
            icon: Icon(
              IconlyBroken.arrow_right,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}
