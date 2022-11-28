import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../ui/styles/color.dart';

class DeleteConfirmationPopup extends StatelessWidget {
  const DeleteConfirmationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        height: 20.w,
        width: 300.0,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(1.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Are You Sure?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 2.0.w,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Text(
                          'After deleting you cannot undo this.',
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
                ],
              ),
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
                        color: ColorsRes.red,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.6.w)),
                        child: Container(
                          height: 6.w,
                          width: 25.w,
                          alignment: Alignment.center,
                          child: Text(
                            'Yes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsRes.white, fontSize: 2.w),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
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
                            'No',
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
