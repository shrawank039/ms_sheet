import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/screens/panels/main_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:sizer/sizer.dart';

import '../../../../global.dart';

class SheetsHistory extends StatefulWidget {
  @override
  State<SheetsHistory> createState() => _SheetsHistoryState();
}

class _SheetsHistoryState extends State<SheetsHistory> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

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
            Card(
              margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.5.w)),
              elevation: 0,
              color: const Color(0xFFf9f9f9),
              child: Padding(
                padding: EdgeInsets.only(left: 1.w),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFf9f9f9),
                    ),
                    isExpanded: false,
                    hint: Text(
                      'Select Sheets',
                      style: TextStyle(
                        fontSize: 6.0.sp,
                        color: const Color.fromARGB(255, 174, 174, 174),
                      ),
                    ),
                    items: sheets
                        .map((item) => DropdownMenuItem<String>(
                              value: item.name,
                              child: Text(
                                item.name.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    //itemHeight: 40,
                    dropdownMaxHeight: 300,
                    searchController: textEditingController,
                    searchInnerWidget: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          // contentPadding: const EdgeInsets.symmetric(
                          //   horizontal: 10,
                          //   vertical: 8,
                          // ),
                          hintText: 'Search for sheets...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value.toString().contains(searchValue));
                    },
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
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
                children: global.sheets.map((e) {
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

Widget sheetsList(
    String? pic, String? name, String? date, BuildContext context) {
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