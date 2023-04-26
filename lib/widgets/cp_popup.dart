import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../providers/data_providers.dart';
import '../repositories/panel_repository.dart';
import '../ui/styles/color.dart';
import 'package:ms_sheet/global.dart' as global;

class CPPopup extends ConsumerStatefulWidget {
  final int sheet_id;
  final String date;
  const CPPopup(this.sheet_id, this.date, {super.key});

  @override
  ConsumerState<CPPopup> createState() => _CPPopupState();
}

class _CPPopupState extends ConsumerState<CPPopup> {
  final cpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: EdgeInsets.all(1.5.w),
        height: 38.w,
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
                      'C/P',
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
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Card(
                  margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5.w)),
                  elevation: 0,
                  color: ColorsRes.lightWeightColor,
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: TextField(
                      maxLines: 10,
                      controller: cpController,
                      onChanged: (val) {
                        if (cpController.text.isNotEmpty) {}
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        hintText: 'Paste Here...',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
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
                    child: Card(
                      margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                      color: ColorsRes.mainBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.6.w)),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            cpController.text = '';
                          });
                        },
                        child: Container(
                          height: 6.w,
                          width: 25.w,
                          alignment: Alignment.center,
                          child: Text(
                            'Clear',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorsRes.white, fontSize: 2.w),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                      color: ColorsRes.mainBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.6.w)),
                      child: InkWell(
                        onTap: () async {
                          if (cpController.text.length > 1) {
                            LineSplitter ls = const LineSplitter();
                            List<String> lineArray =
                                ls.convert(cpController.text);

                          for (int i = 0; i < lineArray.length; i++) {

                            String line = lineArray[i];
                          
                            String amt = '0';
                            String entry = '';
                            int? entryBox, entryAmt;

                            var splitArray = [];

                            if (line.contains(':')) {
                              var split = line.split(':');
                              line = split[split.length - 1];
                            }
                            if (line.contains('=')) {
                              splitArray =
                                  line.split(RegExp(r'=+'));
                            } else if (line.contains('@')) {
                              splitArray =
                                  line.split(RegExp(r'@+'));
                            } else if (line.contains('rs')) {
                              splitArray =
                                  line.split(RegExp(r'rs+'));
                            } else if (line.contains('intu')) {
                              splitArray =
                                  line.split(RegExp(r'intu+'));
                            } else if (line.contains('into')) {
                              splitArray =
                                  line.split(RegExp(r'into+'));
                            } else if (line.contains('\$')) {
                              splitArray =
                                  line.split(RegExp(r'\$+'));
                            } else if (line.contains('&')) {
                              splitArray =
                                  line.split(RegExp(r'&+'));
                            } else if (line.contains('+')) {
                              splitArray =
                                  line.split(RegExp(r'\++'));
                            } else if (line.contains('#')) {
                              splitArray =
                                  line.split(RegExp(r'#+'));
                            } else if (line.contains('*')) {
                              splitArray =
                                  line.split(RegExp(r'\*+'));
                            }

                            if (splitArray.length > 1) {
                              entry = splitArray[0]
                                  .replaceAll(RegExp(r'[^0-9]'), '');
                              amt = splitArray[1]
                                  .replaceAll(RegExp(r'[^0-9]'), '');
                            }

                            if (entry.length.isEven) {
                              for (int i = 0; i < entry.length; i++) {
                                entryBox = int.parse(entry[i] + entry[i + 1]);
                                if (entryBox == 00) {
                                  entryBox = 100;
                                }
                                String pairKey = entryBox.toString();
                                if (entryBox < 10) {
                                  pairKey = pairKey.padLeft(2, '0');
                                }

                                entryAmt = int.parse(amt);
                                global.numberPair[pairKey] =
                                    (global.numberPair[pairKey])! + entryAmt;
                                global.pairKey.add(pairKey);
                                global.pairValue.add(entryAmt!);
                                i = i + 1;
                              }
                            } else {
                              for (int i = 0; i < entry.length; i++) {
                                entryBox = int.parse(
                                    entry[i] + entry[i + 1] + entry[i + 2]);

                                String pairKey = entryBox.toString();
                                if (entryBox < 10) {
                                  pairKey = pairKey.padLeft(2, '0');
                                }

                                entryAmt = int.parse(amt);
                                global.numberPair[pairKey] =
                                    (global.numberPair[pairKey])! + entryAmt;
                                global.pairKey.add(pairKey);
                                global.pairValue.add(entryAmt);
                                i = i + 2;
                              }
                            }
                            }
                            ref.refresh(numberPairProvider);
                            Navigator.of(context).pop();
                          } 
                        },
                        child: Container(
                          height: 6.w,
                          width: 25.w,
                          alignment: Alignment.center,
                          child: Text(
                            'Fetch',
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

extension Numeric on String {
  bool get isNumeric => num.tryParse(this) != null ? true : false;
}
