import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:ms_sheet/models/sheets_response_entity.dart';
import 'package:ms_sheet/ui/screens/panels/main_panel.dart';
import 'package:ms_sheet/ui/screens/panels/master_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:sizer/sizer.dart';

import '../../../../global.dart';
import '../../../../repositories/sheets_repository.dart';

class SheetsHistory extends StatefulWidget {
  @override
  State<SheetsHistory> createState() => _SheetsHistoryState();
}

class _SheetsHistoryState extends State<SheetsHistory> {
  String? selectedValue;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  List<dynamic> _sheetsList = [];

  @override
  void initState() {
    super.initState();
    fetchSheetHistory(DateTime.now().toString().trim());
  }

  void fetchSheetHistory(String date) async {
    _sheetsList.clear();
    var getSheets = await SheetsRepository().getSheetsHistory(date);
    if (getSheets.success == true) {
      setState(() {
        // _controllerDate.text = DateTime.now().toString();
        _sheetsList.addAll(getSheets.data!);
      });
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 1.5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sheets History',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
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
            Flexible(
              child: Card(
                margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.5.w)),
                elevation: 0,
                color: const Color(0xFFf9f9f9),
                child: Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'yyyy-MM-dd',
                    controller: _controllerDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Select Date',
                    timeLabelText: 'Declare Time',
                    onChanged: (val) {
                      setState(() {
                        _controllerDate.text = val;
                      });
                      fetchSheetHistory(val);
                    },
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 2.w),
              color: ColorsRes.mainBlue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.5.w)),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 2.2.w),
                  child: Text(
                    'Create',
                    style: TextStyle(color: ColorsRes.white, fontSize: 1.7.w),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 2.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: _sheetsList.map((e) {
                  return sheetsList(e, _controllerDate.text.trim(), context);
                }).toList(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget sheetsList(SheetsResponseData data, String date, BuildContext context) {
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
              'https://cdn-icons-png.flaticon.com/256/281/281761.png',
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
                  data.name!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 1.7.w,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  data.endTime!,
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
                    builder: (context) => MasterPanel(data.id!, data.name!, date),
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
