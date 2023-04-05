import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_sheet/repositories/assistant_repository.dart';
import 'package:sizer/sizer.dart';

import '../providers/data_providers.dart';
import '../ui/styles/color.dart';

class KhataEntryPopup extends ConsumerWidget {
  final int id;

  KhataEntryPopup(this.id, {super.key});

  final amtController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    amtController.text = '';
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        height: 30.w,
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
                      'Add Points',
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
                        controller: amtController,
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
                          labelText: 'Points',
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
            SizedBox(
              height: 1.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.9.w),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        var declareResult =
                              await AssistantRepository().pointTransfer(
                            id, int.parse(amtController.text)
                          );
                          if (declareResult.success == true) {
                              amtController.text = '';
                              ref.refresh(assistantDataProvider);
                              Navigator.of(context).pop();
                          }else {
                            amtController.text = '${declareResult.message}';
                          }
                      
                      },
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
