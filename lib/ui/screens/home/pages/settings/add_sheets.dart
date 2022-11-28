import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../../../styles/design.dart';

class AddSheets extends StatefulWidget {
  const AddSheets({super.key});

  @override
  State<AddSheets> createState() => _AddSheetsState();
}

class _AddSheetsState extends State<AddSheets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CreateSheets(),
          ],
        ),
      ],
    );
  }
}

class CreateSheets extends StatefulWidget {
  const CreateSheets({super.key});

  @override
  State<CreateSheets> createState() => _CreateSheetsState();
}

class _CreateSheetsState extends State<CreateSheets> {
  String _valueChanged4 = '';
  String _valueToValidate4 = '';
  String _valueSaved4 = '';

  late TextEditingController _controller4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _controller4 = TextEditingController(text: '$lsHour:$lsMinute');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            Padding(
              padding: EdgeInsets.only(left: 1.0.w, right: 1.w),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorsRes.darkGrey,
                        size: 2.8.w,
                      )),
                  Text(
                    'Add Sheet',
                    style:
                        TextStyle(color: ColorsRes.darkGrey, fontSize: 2.0.w),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 2.w,
                  )),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        style: TextStyle(
                            fontSize: 2.3.w,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.title,
                            color: ColorsRes.darkGrey,
                          ),
                          isDense: true,
                          hintText: 'Enter sheet name',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: DateTimePicker(
                          type: DateTimePickerType.time,
                          //timePickerEntryModeInput: true,
                          controller: _controller4,
                          //initialValue: '',
                          icon: Icon(Icons.access_time),
                          timeLabelText: "End Time",
                          use24HourFormat: false,
                          locale: Locale('en', 'IN'),
                          onChanged: (val) {
                            print('0' + val.toString());
                            setState(() {
                              _controller4.text = val;
                            });
                          },
                          validator: (val) {
                            print('1' + val.toString());
                            setState(() => _controller4.text = val ?? '');
                            return null;
                          },
                          onSaved: (val) {
                            print('2' + val.toString());
                            setState(() => _controller4.text = val ?? '');
                          }),
                      /*DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'End Date',
                        timeLabelText: "End",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),*/
                    ),
                  ),
                )),
                /*Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child:
                      DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Declare Time',
                        timeLabelText: "Declare Time",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return false;
                          }

                          return true;
                        },
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ),
                )),*/
                SizedBox(
                  width: 2.w,
                ),
                Card(
                  margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                  color: ColorsRes.mainBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.6.w)),
                  child: Container(
                    height: 6.w,
                    width: 25.w,
                    alignment: Alignment.center,
                    child: Text(
                      'Add',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorsRes.white, fontSize: 2.w),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
