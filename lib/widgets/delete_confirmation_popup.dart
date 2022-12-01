import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../ui/styles/color.dart';

class DeleteConfirmationPopup extends StatelessWidget {
  const DeleteConfirmationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(2.5.w),
            width: 60.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                            fontSize: 9.0.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        'After deleting you cannot undo this.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 7.0.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                      Container(
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
        ],
      ),
    );
  }
}
