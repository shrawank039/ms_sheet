import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../ui/styles/color.dart';

class KhataEntryPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        height: 45.w,
        width: 300.0,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      'Create New Entry',
                      style:
                          TextStyle(color: ColorsRes.darkGrey, fontSize: 2.5.w),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 2.5.w,
                    ))
              ],
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
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 2.5.w,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: ColorsRes.darkGrey,
                          ),
                          isDense: true,
                          hintText: '00',
                          labelText: 'Amount',
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
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 2.5.w,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: ColorsRes.darkGrey,
                          ),
                          isDense: true,
                          hintText: 'Optional',
                          labelText: 'Details',
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
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Declare Time',
                        timeLabelText: 'Declare Time',
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
                )),
                Expanded(
                    child: Card(
                  margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5.w)),
                  elevation: 0,
                  color: ColorsRes.lightWeightColor,
                  child: Container(
                    height: 7.5.w,
                    child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              size: 3.w,
                              color: ColorsRes.darkGrey,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              'Attach File',
                              style: TextStyle(fontSize: 2.w),
                            )
                          ],
                        )),
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 1.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.9.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (() => Navigator.of(context).pop()),
                      child: Card(
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
                            'Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsRes.white, fontSize: 2.w),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
