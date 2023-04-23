import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:sizer/sizer.dart';

import '../ui/styles/color.dart';

class LaddiPopup extends ConsumerStatefulWidget {
  const LaddiPopup({super.key});

  @override
  ConsumerState<LaddiPopup> createState() => _LaddiPopupState();
}

class _LaddiPopupState extends ConsumerState<LaddiPopup> {
  final amtController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final amtCrossController = TextEditingController();
  final fromCrossController = TextEditingController();
  final toCrossController = TextEditingController();
  bool checkBox = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    amtController.dispose();
    fromController.dispose();
    toController.dispose();
    amtCrossController.dispose();
    fromCrossController.dispose();
    toCrossController.dispose();
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
                      'Add Laddi',
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
                    //margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        controller: fromController,
                        //maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: 'From',
                          isDense: true,
                          hintText: '00',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    //margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        // maxLength: 1,
                        controller: toController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: 'To',
                          isDense: true,
                          hintText: '00',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    //margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        // maxLength: 2,
                        controller: amtController,
                        onChanged: (val) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          isDense: true,
                          hintText: '0',
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
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  'Add Crossing',
                  style: TextStyle(color: ColorsRes.darkGrey, fontSize: 2.5.w),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    //margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        controller: fromCrossController,
                        //maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: 'From',
                          isDense: true,
                          hintText: '00',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    //margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        // maxLength: 1,
                        controller: toCrossController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: 'To',
                          isDense: true,
                          hintText: '00',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  // height: 9.w,
                  child: Card(
                    //margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: ColorsRes.lightWeightColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: TextField(
                        // maxLength: 2,
                        controller: amtCrossController,
                        onChanged: (val) {
                          setState(() {});
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          isDense: true,
                          hintText: '0',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Exclude Pair',
                    style:
                        TextStyle(color: ColorsRes.darkGrey, fontSize: 1.5.w),
                  ),
                ),
                Checkbox(
                  value: checkBox,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value!;
                    });
                    print('agentsDataProvider 0 : ${global.numberPair}');
                    ref.refresh(numberPairProvider);
                  },
                ),
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
                    child: Card(
                      margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                      color: ColorsRes.mainBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.6.w)),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            fromController.text = '';
                            toController.text = '';
                            amtController.text = '';
                            fromCrossController.text = '';
                            toCrossController.text = '';
                            amtCrossController.text = '';
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
                        onTap: () {
                          var crossingPair = [];

                          if (amtController.text.isNotEmpty &&
                              fromController.text.isNotEmpty &&
                              toController.text.isNotEmpty) {
                            int from = int.parse(fromController.text);
                            int to = int.parse(toController.text);
                            int amt = int.parse(amtController.text);

                            for (int i = from; i <= to; i++) {
                              String pairKey = i.toString();
                              if (i < 10) {
                              pairKey = pairKey.padLeft(2, '0');
                              }
                              global.numberPair[pairKey] =
                                  global.numberPair[pairKey]! + amt;
                      
                            }
                          }
                          if (amtCrossController.text.isNotEmpty &&
                              fromCrossController.text.isNotEmpty &&
                              toCrossController.text.isNotEmpty) {
                            String fromCross = fromCrossController.text;
                            String toCross = toCrossController.text;
                            int amtCross = int.parse(amtCrossController.text);

                            for (int t = 0; t < toCross.length; t++) {
                              for (int i = 0; i < fromCross.length; i++) {
                                String pair = fromCross[i] + toCross[t];
                                if (checkBox && fromCross[i] == toCross[t]) {
                                } else {
                                  crossingPair.add(pair);
                                }
                              }
                            }

                            for (int i = 0; i < crossingPair.length; i++) {
                              String a = crossingPair[i];
                              global.numberPair[a] =
                                  global.numberPair[a]! + amtCross;
                              print(i.toString().padLeft(2, '0'));
                            }
                          }
                          fromController.text = '';
                          toController.text = '';
                          amtController.text = '';
                          fromCrossController.text = '';
                          toCrossController.text = '';
                          amtCrossController.text = '';
                          crossingPair.clear();
                          ref.refresh(numberPairProvider);
                        },
                        child: Container(
                          height: 6.w,
                          width: 25.w,
                          alignment: Alignment.center,
                          child: Text(
                            'Add',
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
