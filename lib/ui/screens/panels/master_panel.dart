import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/widgets/generate.dart';
import 'package:sizer/sizer.dart';

import '../../../models/agents_response_entity.dart';
import '../../../models/panel_response_entity.dart';
import '../../../providers/data_providers.dart';
import '../../styles/design.dart';

final FocusNode _focusNode = FocusNode();
final FocusNode focusNode = FocusNode();
var _selectedList;
var selectPairList;
List<int> checkBox = [];
bool commCheck = false,
    pattiCheck = false,
    inOutCheck = false,
    roundCheck = false;
AgentsResponseData? selectedAgents;

class MasterPanel extends ConsumerStatefulWidget {
  final int sheet_id;
  final String date;
  final String sheet_name;

  const MasterPanel(this.sheet_id, this.sheet_name, this.date, {super.key});

  @override
  ConsumerState<MasterPanel> createState() => _MasterPanelState();
}

class _MasterPanelState extends ConsumerState<MasterPanel> {
  bool focusAmount = false;
  int? entryBox, entryAmt;
  AgentsResponseData? selectedAgents;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController entryBoxController = TextEditingController();
  final TextEditingController entryAmtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    global.numberPair = {
      '00': 0,
      '01': 0,
      '02': 0,
      '03': 0,
      '04': 0,
      '05': 0,
      '06': 0,
      '07': 0,
      '08': 0,
      '09': 0,
      '10': 0,
      '11': 0,
      '12': 0,
      '13': 0,
      '14': 0,
      '15': 0,
      '16': 0,
      '17': 0,
      '18': 0,
      '19': 0,
      '20': 0,
      '21': 0,
      '22': 0,
      '23': 0,
      '24': 0,
      '25': 0,
      '26': 0,
      '27': 0,
      '28': 0,
      '29': 0,
      '30': 0,
      '31': 0,
      '32': 0,
      '33': 0,
      '34': 0,
      '35': 0,
      '36': 0,
      '37': 0,
      '38': 0,
      '39': 0,
      '40': 0,
      '41': 0,
      '42': 0,
      '43': 0,
      '44': 0,
      '45': 0,
      '46': 0,
      '47': 0,
      '48': 0,
      '49': 0,
      '50': 0,
      '51': 0,
      '52': 0,
      '53': 0,
      '54': 0,
      '55': 0,
      '56': 0,
      '57': 0,
      '58': 0,
      '59': 0,
      '60': 0,
      '61': 0,
      '62': 0,
      '63': 0,
      '64': 0,
      '65': 0,
      '66': 0,
      '67': 0,
      '68': 0,
      '69': 0,
      '70': 0,
      '71': 0,
      '72': 0,
      '73': 0,
      '74': 0,
      '75': 0,
      '76': 0,
      '77': 0,
      '78': 0,
      '79': 0,
      '80': 0,
      '81': 0,
      '82': 0,
      '83': 0,
      '84': 0,
      '85': 0,
      '86': 0,
      '87': 0,
      '88': 0,
      '89': 0,
      '90': 0,
      '91': 0,
      '92': 0,
      '93': 0,
      '94': 0,
      '95': 0,
      '96': 0,
      '97': 0,
      '98': 0,
      '99': 0,
      '100': 0,
      '101': 0,
      '102': 0,
      '103': 0,
      '104': 0,
      '105': 0,
      '106': 0,
      '107': 0,
      '108': 0,
      '109': 0,
      '110': 0,
      '111': 0,
      '112': 0,
      '113': 0,
      '114': 0,
      '115': 0,
      '116': 0,
      '117': 0,
      '118': 0,
      '119': 0,
      '120': 0,
    };
    commCheck = false;
    pattiCheck = false;
    inOutCheck = false;
    roundCheck = false;
    _selectedList = null;
    selectPairList = global.numberPair;
    checkBox.clear();
  }

  @override
  void dispose() {
    global.numberPair = {
      '00': 0,
      '01': 0,
      '02': 0,
      '03': 0,
      '04': 0,
      '05': 0,
      '06': 0,
      '07': 0,
      '08': 0,
      '09': 0,
      '10': 0,
      '11': 0,
      '12': 0,
      '13': 0,
      '14': 0,
      '15': 0,
      '16': 0,
      '17': 0,
      '18': 0,
      '19': 0,
      '20': 0,
      '21': 0,
      '22': 0,
      '23': 0,
      '24': 0,
      '25': 0,
      '26': 0,
      '27': 0,
      '28': 0,
      '29': 0,
      '30': 0,
      '31': 0,
      '32': 0,
      '33': 0,
      '34': 0,
      '35': 0,
      '36': 0,
      '37': 0,
      '38': 0,
      '39': 0,
      '40': 0,
      '41': 0,
      '42': 0,
      '43': 0,
      '44': 0,
      '45': 0,
      '46': 0,
      '47': 0,
      '48': 0,
      '49': 0,
      '50': 0,
      '51': 0,
      '52': 0,
      '53': 0,
      '54': 0,
      '55': 0,
      '56': 0,
      '57': 0,
      '58': 0,
      '59': 0,
      '60': 0,
      '61': 0,
      '62': 0,
      '63': 0,
      '64': 0,
      '65': 0,
      '66': 0,
      '67': 0,
      '68': 0,
      '69': 0,
      '70': 0,
      '71': 0,
      '72': 0,
      '73': 0,
      '74': 0,
      '75': 0,
      '76': 0,
      '77': 0,
      '78': 0,
      '79': 0,
      '80': 0,
      '81': 0,
      '82': 0,
      '83': 0,
      '84': 0,
      '85': 0,
      '86': 0,
      '87': 0,
      '88': 0,
      '89': 0,
      '90': 0,
      '91': 0,
      '92': 0,
      '93': 0,
      '94': 0,
      '95': 0,
      '96': 0,
      '97': 0,
      '98': 0,
      '99': 0,
      '100': 0,
      '101': 0,
      '102': 0,
      '103': 0,
      '104': 0,
      '105': 0,
      '106': 0,
      '107': 0,
      '108': 0,
      '109': 0,
      '110': 0,
      '111': 0,
      '112': 0,
      '113': 0,
      '114': 0,
      '115': 0,
      '116': 0,
      '117': 0,
      '118': 0,
      '119': 0,
      '120': 0,
    };
    commCheck = false;
    pattiCheck = false;
    inOutCheck = false;
    roundCheck = false;
    _selectedList = null;
    textEditingController.dispose();
    entryBoxController.dispose();
    entryAmtController.dispose();
    selectPairList = global.numberPair;
    checkBox.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ExtraDataParameter extraDataParameter =
        ExtraDataParameter(dataList: [widget.sheet_id, widget.date]);

    final _data = ref.watch(panelDataProvider(extraDataParameter));
    final _dataNumberPair = ref.watch(numberPairProvider);

    var total = 0;
    for (int i = 0; i < global.numberPair.length; i++) {
      String pairKey = i.toString();
      if (i < 10) {
        pairKey = pairKey.padLeft(2, '0');
      }
      total += global.numberPair[pairKey]!;
    }

    KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
      if (event is RawKeyDownEvent) {
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          setState(() {
            _focusNode.focusInDirection(TraversalDirection.up);
            print('kReleaseMode (false) : arrowUp');
          });
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          setState(() {
            _focusNode.focusInDirection(TraversalDirection.down);
            print('kReleaseMode (false) : arrowDown');
          });
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          setState(() {
            _focusNode.previousFocus();
            print('kReleaseMode (false) : arrowLeft');
          });
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          setState(() {
            _focusNode.nextFocus();
            print('kReleaseMode (false) : arrowRight');
          });
        } else if (event.logicalKey == LogicalKeyboardKey.tab) {
          setState(() {
            //_focusNode.nextFocus();
            print('kReleaseMode (false) : tab');
          });
        } else if (event.logicalKey == LogicalKeyboardKey.enter) {
          setState(() {
            //_focusNode.nextFocus();
            print('kReleaseMode (false) : enter');
          });
        }
      }
      return KeyEventResult.ignored;
    }

    return Scaffold(
      body: SafeArea(
        child: Focus(
          focusNode: _focusNode,
          onKey: _handleKeyEvent,
          child: Padding(
            padding: EdgeInsets.all(1.5.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 1.w, left: 3.w, right: 3.w, bottom: 1.w),
                    decoration: DesignConfig.boxDecorationContainerCardShadow(
                      ColorsRes.white,
                      Color.fromRGBO(44, 39, 46, 0.059),
                      12.0,
                      3,
                      3,
                      20,
                      0,
                    ),
                    //Creating the Sheet
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                hoverColor: Colors.transparent,
                                icon: Icon(Icons.arrow_back)),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              'Draw :',
                              style: TextStyle(
                                  color: ColorsRes.darkGrey, fontSize: 2.5.w),
                            ),
                            Text(
                              ' ${widget.sheet_name} - ${widget.date}',
                              style: TextStyle(
                                  color: ColorsRes.mainBlue, fontSize: 2.5.w),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AlignedGridView.count(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          crossAxisCount: 10,
                                          itemCount: 100,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                          itemBuilder: (context, index) {
                                            return numberBox(index);
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: SizedBox(
                                              width: 8.w,
                                              child: AlignedGridView.count(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                crossAxisCount: 1,
                                                itemCount: 10,
                                                mainAxisSpacing: 0,
                                                crossAxisSpacing: 0,
                                                itemBuilder: (context, index) {
                                                  int total = 0;
                                                    for (int i = index * 10;
                                                        i < index * 10 + 10;
                                                        i++) {
                                                      String pairKey =
                                                          (i + 1).toString();
                                                      if (i < 10) {
                                                        pairKey = pairKey
                                                            .padLeft(2, '0');
                                                      }
                                                      total = total +
                                                          global.numberPair[
                                                              pairKey]!;
                                                    }
                                                  return Container(
                                                    padding: EdgeInsets.only(
                                                        left: 1.w,
                                                        top: 1.w,
                                                        bottom: 1.w),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    //height: 4.w,
                                                    child: Text(
                                                      "$total",
                                                      style: TextStyle(
                                                          fontSize: 2.2.w),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // SizedBox(
                                  //   height: 1.w,
                                  // ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AlignedGridView.count(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          crossAxisCount: 10,
                                          itemCount: 20,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                          itemBuilder: (context, index) {
                                            return numberBox(index + 100);
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(1.w),
                                            child: SizedBox(
                                              width: 8.w,
                                              child: AlignedGridView.count(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                crossAxisCount: 1,
                                                itemCount: 2,
                                                mainAxisSpacing: 0,
                                                crossAxisSpacing: 0,
                                                itemBuilder: (context, index) {
                                                  int total = 0;
                                                    for (int i = index * 10;
                                                        i < index * 10 + 10;
                                                        i++) {
                                                      total = total +
                                                          global.numberPair[
                                                              (i + 101)
                                                                  .toString()]!;
                                                    }
                                                  return Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    height: 5.5.w,
                                                    child: Text(
                                                      "$total",
                                                      style: TextStyle(
                                                          fontSize: 2.2.w),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 2.w,
                              ),
                            ),
                            Text(
                              "Total: ",
                              style: TextStyle(
                                  fontSize: 2.2.w,
                                  color: ColorsRes.darkGrey,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: 9.w,
                              alignment: Alignment.centerLeft,
                              //height: 5.5.w,
                              child: Text(
                                "$total",
                                style: TextStyle(
                                    fontSize: 2.2.w,
                                    color: ColorsRes.mainBlue,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 2.w,
                          ),
                        ),
                        controls(),
                        Expanded(
                          child: SizedBox(
                            height: 0.5.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 40.w,
                  padding: EdgeInsets.only(left: 2.w),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '  Clients',
                                    textAlign: TextAlign.start,
                                  ),
                                  Consumer(
                                    builder: (BuildContext context,
                                        WidgetRef ref, Widget? child) {
                                      return _data.when(data: (dynamic data) {
                                        return Column(
                                          children: _data.value!.data!.map((e) {
                                            var data = convertPair(e);
                                            return clientsList(
                                                e,
                                                extraDataParameter,
                                                data,
                                                context);
                                          }).toList(),
                                        );
                                      }, error: (Object error,
                                          StackTrace stackTrace) {
                                        return Text('Error');
                                      }, loading: () {
                                        return Center(
                                          child: LoadingAnimationWidget
                                              .staggeredDotsWave(
                                            color: Colors.grey,
                                            size: 40,
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                    height: 2.w,
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Card(
                            color: ColorsRes.lightWeightColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.5.w)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0.7.h,
                                horizontal: 2.w,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Focus(
                                      //focusNode: _focusNode,
                                      child: TextField(
                                        textInputAction: TextInputAction.next,
                                        controller: entryBoxController,
                                        textAlign: TextAlign.start,
                                        scribbleEnabled: true,
                                        style: const TextStyle(
                                            color: ColorsRes.mainBlue,
                                            fontWeight: FontWeight.w700),
                                        decoration: InputDecoration(
                                          hintText: 'Enter box no.',
                                          isCollapsed: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 1.2.w,
                                              top: 0.5.w,
                                              bottom: 0.5.w),
                                          hoverColor: ColorsRes.lightBlue,
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              color: ColorsRes.lightWeightColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.5.w)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 0.7.h,
                                  horizontal: 2.w,
                                ),
                                child: Focus(
                                  //focusNode: _focusNode,
                                  child: Focus(
                                    canRequestFocus: false,
                                    onFocusChange: (focus) {
                                      focusAmount = focus;
                                      debugPrint('Amount Focus : $focus');
                                    },
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: entryAmtController,
                                      textAlign: TextAlign.start,
                                      scribbleEnabled: true,
                                      style: const TextStyle(
                                          color: ColorsRes.mainBlue,
                                          fontWeight: FontWeight.w700),
                                      decoration: InputDecoration(
                                        hintText: 'Amount',
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.only(
                                            left: 1.2.w,
                                            top: 0.5.w,
                                            bottom: 0.5.w),
                                        hoverColor: ColorsRes.lightBlue,
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (selectedAgents != null) {
                                if (entryBoxController.text.length.isEven) {
                                  for (int i = 0;
                                      i < entryBoxController.text.length;
                                      i++) {
                                    entryBox = int.parse(
                                        entryBoxController.text[i] +
                                            entryBoxController.text[i + 1]);
                                    if (entryBox == 00) {
                                      entryBox = 100;
                                    }
                                    String pairKey = entryBox.toString();
                                    if (entryBox! < 10) {
                                      pairKey = pairKey.padLeft(2, '0');
                                    }

                                    entryAmt =
                                        int.parse(entryAmtController.text);
                                    global.numberPair[pairKey] =
                                        (global.numberPair[pairKey])! +
                                            entryAmt!;
                                    global.pairKey.add(pairKey);
                                    global.pairValue.add(entryAmt!);
                                    i = i + 1;
                                  }
                                } else {
                                  for (int i = 0;
                                      i < entryBoxController.text.length;
                                      i++) {
                                    entryBox = int.parse(
                                        entryBoxController.text[i] +
                                            entryBoxController.text[i + 1] +
                                            entryBoxController.text[i + 2]);

                                    String pairKey = entryBox.toString();
                                    if (entryBox! < 10) {
                                      pairKey = pairKey.padLeft(2, '0');
                                    }

                                    entryAmt =
                                        int.parse(entryAmtController.text);
                                    global.numberPair[pairKey] =
                                        (global.numberPair[pairKey])! +
                                            entryAmt!;
                                    global.pairKey.add(pairKey);
                                    global.pairValue.add(entryAmt!);
                                    i = i + 2;
                                  }
                                }
                                ref.refresh(numberPairProvider);
                              }
                            },
                            child: DesignConfig.flatButtonWithIcon(
                              ColorsRes.mainBlue,
                              1.6.w,
                              Icons.done,
                              ColorsRes.white,
                              2.6.w,
                              'Enter',
                              2.w,
                              ColorsRes.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1.0.w),
                              decoration:
                                  DesignConfig.boxDecorationContainerCardShadow(
                                ColorsRes.white,
                                Color.fromRGBO(44, 39, 46, 0.059),
                                16.0,
                                3,
                                3,
                                20,
                                0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Card(
                                  //   //margin: EdgeInsets.only(left: 1.w),
                                  //   color: ColorsRes.lightBlue,
                                  //   elevation: 0,
                                  //   shape: RoundedRectangleBorder(
                                  //       borderRadius:
                                  //           BorderRadius.circular(1.8.w)),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.only(
                                  //         top: 0.7.h,
                                  //         bottom: 0.7.h,
                                  //         left: 0.8.w),
                                  //     child: Row(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       children: [
                                  //         SizedBox(
                                  //           width: 0.1.w,
                                  //         ),
                                  //         Icon(
                                  //           FontAwesomeIcons.share,
                                  //           color: ColorsRes.mainBlue,
                                  //           size: 2.w,
                                  //         ),
                                  //         SizedBox(
                                  //           width: 1.0.w,
                                  //         ),
                                  //         Text(
                                  //           'Share',
                                  //           style: TextStyle(
                                  //             color: ColorsRes.mainBlue,
                                  //             fontSize: 1.5.w,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: 1.0.w,
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  // Card(
                                  //   // margin: EdgeInsets.only(left: 2.w),
                                  //   color: ColorsRes.lightBlue,
                                  //   elevation: 0,
                                  //   shape: RoundedRectangleBorder(
                                  //       borderRadius:
                                  //           BorderRadius.circular(1.8.w)),
                                  //   child: Padding(
                                  //     padding: EdgeInsets.only(
                                  //         top: 0.7.h,
                                  //         bottom: 0.7.h,
                                  //         left: 1.8.w),
                                  //     child: Row(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       children: [
                                  //         SizedBox(
                                  //           width: 0.1.w,
                                  //         ),
                                  //         Icon(
                                  //           FontAwesomeIcons.whatsapp,
                                  //           color: ColorsRes.mainBlue,
                                  //           size: 2.w,
                                  //         ),
                                  //         SizedBox(
                                  //           width: 1.0.w,
                                  //         ),
                                  //         Text(
                                  //           'Share',
                                  //           style: TextStyle(
                                  //             color: ColorsRes.mainBlue,
                                  //             fontSize: 1.5.w,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: 1.0.w,
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      String generate = '';
                                      for (int i = 0;
                                          i < global.numberPair.length;
                                          i++) {
                                        String pairKey = i.toString();
                                        if (i < 10) {
                                          pairKey = pairKey.padLeft(2, '0');
                                        }
                                        if (global.numberPair[pairKey]! > 0) {
                                          generate =
                                              '$generate$pairKey(${global.numberPair[pairKey]!})';
                                        }
                                      }
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              Generate(generate));
                                    },
                                    child: Card(
                                      //margin: EdgeInsets.only(left: 2.w),
                                      color: ColorsRes.lightBlue,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.8.w)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 0.7.h,
                                            bottom: 0.7.h,
                                            left: 1.8.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 0.1.w,
                                            ),
                                            Icon(
                                              Icons.generating_tokens,
                                              color: ColorsRes.mainBlue,
                                              size: 2.w,
                                            ),
                                            SizedBox(
                                              width: 1.0.w,
                                            ),
                                            Text(
                                              'Generate',
                                              style: TextStyle(
                                                color: ColorsRes.mainBlue,
                                                fontSize: 1.5.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1.0.w,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget numberBox(int index) {
  final TextEditingController pointController = TextEditingController();

  String pairKey = (index + 1).toString();
  if (index + 1 < 10) {
    pairKey = pairKey.padLeft(2, '0');
  }

  if (global.numberPair[pairKey]! > 0) {
    pointController.text = global.numberPair[pairKey].toString();
  }

  pointController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: pointController.text.length,
  );

  return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
    return Container(
      padding: EdgeInsets.only(left: 1.w),
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: ColorsRes.greyLightColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (index + 1).toString(),
            style: TextStyle(fontSize: 0.8.h, color: Colors.grey),
          ),
          TextField(
            enabled: false,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.end,
            scribbleEnabled: true,
            controller: pointController,
            style: const TextStyle(
                color: ColorsRes.mainBlue, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding:
                  EdgeInsets.only(left: 1.2.w, top: 0.5.w, bottom: 0.5.w),
              hoverColor: ColorsRes.lightBlue,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              global.numberPair[pairKey] = int.parse(value);
              print('onChanged ${global.numberPair[index]}');
            },
            onTap: () {
              ref.refresh(numberPairProvider);
            },
          ),
        ],
      ),
    );
  });
}

Widget controls() {
  int? cuttingUp, cuttingDown, dabbaUp, dabbaDown, percent;
  final TextEditingController cuttingUpController = TextEditingController();
  final TextEditingController cuttingDownController = TextEditingController();
  final TextEditingController dabbaUpController = TextEditingController();
  final TextEditingController dabbaDownController = TextEditingController();
  final TextEditingController percentController = TextEditingController();
  percentController.text = '100';
  final Function(String) callback;

  bool focusAmount = false;
  int? entryBox, entryAmt;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController entryBoxController = TextEditingController();
  final TextEditingController entryAmtController = TextEditingController();

  cuttingUpController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: cuttingUpController.text.length,
  );
  cuttingDownController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: cuttingDownController.text.length,
  );
  dabbaUpController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: dabbaUpController.text.length,
  );
  dabbaDownController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: dabbaDownController.text.length,
  );
  percentController.selection = TextSelection(
    baseOffset: 0,
    extentOffset: percentController.text.length,
  );

  return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 1.2.w,
            ),
            Expanded(
              child: DesignConfig.inputBoxDecoratedBordered(
                const Color(0xFFf9f9f9),
                1.5.w,
                2.2.w,
                'Cutting Up',
                Icons.mobile_friendly,
                3.w,
                TextInputType.number,
                cuttingUpController,
                (value) {
                  if (value == '') {
                    value = '0';
                  }
                  global.numberPair = convertPair(_selectedList);
                  if (value != '0') {
                    String maxPair = '00';
                    for (int i = 0; i < global.numberPair.length; i++) {
                      String pairKey = i.toString();
                      if (i < 10) {
                        pairKey = pairKey.padLeft(2, '0');
                      }
                      if (global.numberPair[pairKey]! >
                          global.numberPair[maxPair]!) {
                        global.numberPair[maxPair] =
                            global.numberPair[pairKey]!;
                      }
                    }
                    global.numberPair[maxPair] = global.numberPair[maxPair]! - int.parse(value);
                        for (int i = 0; i < global.numberPair.length; i++) {
                      String pairKey = i.toString();
                      if (i < 10) {
                        pairKey = pairKey.padLeft(2, '0');
                      }
                      if (global.numberPair[pairKey]! >
                          global.numberPair[maxPair]!) {
                        global.numberPair[pairKey] =
                            global.numberPair[maxPair]!;
                      }
                    }
                  }
                  ref.refresh(numberPairProvider);
                  print('on changed $_selectedList');
                },
              ),
            ),
            Expanded(
              child: DesignConfig.inputBoxDecoratedBordered(
                const Color(0xFFf9f9f9),
                1.5.w,
                2.2.w,
                'Cutting Down',
                Icons.mobile_friendly,
                3.w,
                TextInputType.number,
                cuttingDownController,
                (value) {
                  if (value == '') {
                    value = '0';
                  }
                  global.numberPair = convertPair(_selectedList);
                  if (value != '0') {
                    for (int i = 0; i < global.numberPair.length; i++) {
                      String pairKey = i.toString();
                      if (i < 10) {
                        pairKey = pairKey.padLeft(2, '0');
                      }
                      if (global.numberPair[pairKey]! <= int.parse(value) &&
                          global.numberPair[pairKey]! > 0) {
                        global.numberPair[pairKey] =
                            (global.numberPair[pairKey]! - int.parse(value));
                      }
                    }
                  }
                  ref.refresh(numberPairProvider);
                  print('on changed $_selectedList');
                },
              ),
            ),
            Expanded(
              child: DesignConfig.inputBoxDecoratedBordered(
                const Color(0xFFf9f9f9),
                1.5.w,
                2.2.w,
                '100%',
                Icons.mobile_friendly,
                3.w,
                TextInputType.number,
                percentController,
                (value) {
                  if (value == '') {
                    value = '100';
                  }
                  global.numberPair = convertPair(_selectedList);
                  if (value != '100') {
                    for (int i = 0; i < global.numberPair.length; i++) {
                      String pairKey = i.toString();
                      if (i < 10) {
                        pairKey = pairKey.padLeft(2, '0');
                      }
                      if (global.numberPair[pairKey]! > 0) {
                        int percent = int.parse(value);
                        var finalValue =
                            (global.numberPair[pairKey]! * percent) / 100;
                        global.numberPair[pairKey] = finalValue.toInt();
                      }
                    }
                  }
                  ref.refresh(numberPairProvider);
                  print('on changed $_selectedList');
                },
              ),
            ),
            Expanded(
              child: DesignConfig.inputBoxDecoratedBordered(
                const Color(0xFFf9f9f9),
                1.5.w,
                2.2.w,
                'Dabba Up',
                Icons.mobile_friendly,
                3.w,
                TextInputType.number,
                dabbaUpController,
                (value) {
                  if (value == '') {
                    value = '999999999';
                  }
                  global.numberPair = convertPair(_selectedList);
                  if (value != '999999999') {
                    for (int i = 0; i < global.numberPair.length; i++) {
                      String pairKey = i.toString();
                      if (i < 10) {
                        pairKey = pairKey.padLeft(2, '0');
                      }
                      if (global.numberPair[pairKey]! >= int.parse(value)) {
                        global.numberPair[pairKey] = 0;
                      }
                    }
                  }
                  ref.refresh(numberPairProvider);
                  print('on changed $_selectedList');
                },
              ),
            ),
            Expanded(
              child: DesignConfig.inputBoxDecoratedBordered(
                const Color(0xFFf9f9f9),
                1.5.w,
                2.2.w,
                'Dabba Down',
                Icons.mobile_friendly,
                3.w,
                TextInputType.number,
                dabbaDownController,
                (value) {
                  if (value == '') {
                    value = '0';
                  }
                  global.numberPair = convertPair(_selectedList);
                  if (value != '0') {
                    for (int i = 0; i < global.numberPair.length; i++) {
                      String pairKey = i.toString();
                      if (i < 10) {
                        pairKey = pairKey.padLeft(2, '0');
                      }
                      if (global.numberPair[pairKey]! <= int.parse(value)) {
                        global.numberPair[pairKey] = 0;
                      }
                    }
                  }
                  ref.refresh(numberPairProvider);
                  print('on changed $_selectedList');
                },
              ),
            ),
            SizedBox(
              width: 5.w,
            )
          ],
        ),
        SizedBox(
          height: 1.5.w,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                        ColorsRes.lightBlue,
                        1.5.w,
                        ColorsRes.mainBlue,
                        "Round",
                        2.w,
                        ColorsRes.mainBlue,
                        roundCheck, (value) {
                      roundCheck = value;
                      if (value) {
                        for (int i = 0; i < global.numberPair.length; i++) {
                          String pairKey = i.toString();
                          if (i < 10) {
                            pairKey = pairKey.padLeft(2, '0');
                          }
                          if (global.numberPair[pairKey]! > 0) {
                            while (global.numberPair[pairKey]! % 5 != 0) {
                              //debugPrint("Round Click : ${global.numberPair[pairKey]}");
                              global.numberPair[pairKey] =
                                  global.numberPair[pairKey]! + 1;
                            }
                          }
                        }
                      } else {
                        global.numberPair = convertPair(_selectedList);
                      }
                      ref.refresh(numberPairProvider);
                    }),
                  ),
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                        ColorsRes.lightBlue,
                        1.5.w,
                        ColorsRes.mainBlue,
                        "In/Out",
                        2.w,
                        ColorsRes.mainBlue,
                        inOutCheck, (value) {
                      inOutCheck = value;
                      if (value) {
                        double inout = global.numberPair['101']! / 10;
                        double inout2 = global.numberPair['110']! / 10;
                        if (global.numberPair["101"]! > 0) {
                          for (int i = 0; i < 10; i++) {
                            int a = i * 10 + 1;
                            String pairKey = a.toString();
                            if (i < 10) {
                              pairKey = pairKey.padLeft(2, '0');
                            }
                            global.numberPair[pairKey] =
                                (global.numberPair[pairKey]! + inout).toInt();
                          }
                        }
                        if (global.numberPair['110']! > 0) {
                          for (int i = 0; i < 10; i++) {
                            int a = i * 10 + 10;
                            String pairKey = a.toString();
                            if (i < 10) {
                              pairKey = pairKey.padLeft(2, '0');
                            }
                            global.numberPair[pairKey] =
                                (global.numberPair[pairKey]! + inout2).toInt();
                          }
                        }
                        global.numberPair['101'] = 0;
                        global.numberPair['110'] = 0;
                      } else {
                        global.numberPair = convertPair(_selectedList);
                      }
                      ref.refresh(numberPairProvider);
                    }),
                  ),
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                        ColorsRes.lightBlue,
                        1.5.w,
                        ColorsRes.mainBlue,
                        "Comm",
                        2.w,
                        ColorsRes.mainBlue,
                        commCheck, (value) {
                      print('selectedAgents 0 : ${selectedAgents!.commission}');
                      commCheck = value;
                      double commission =
                          double.parse(selectedAgents!.commission!) / 100;
                      if (value) {
                        for (int i = 0; i < global.numberPair.length; i++) {
                          String pairKey = i.toString();
                          if (i < 10) {
                            pairKey = pairKey.padLeft(2, '0');
                          }
                          if (global.numberPair[pairKey]! > 0) {
                            global.numberPair[pairKey] =
                                (global.numberPair[pairKey]! -
                                        (selectPairList[pairKey]! * commission))
                                    .toInt();
                          }
                        }
                      } else {
                        global.numberPair = convertPair(_selectedList);
                      }
                      ref.refresh(numberPairProvider);
                      print('checkCallback : $value');
                    }),
                  ),
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                        ColorsRes.lightBlue,
                        1.5.w,
                        ColorsRes.mainBlue,
                        "Patti",
                        2.w,
                        ColorsRes.mainBlue,
                        pattiCheck, (value) {
                      pattiCheck = value;
                      double patti = double.parse(selectedAgents!.patti!) / 100;
                      if (value) {
                        for (int i = 0; i < global.numberPair.length; i++) {
                          String pairKey = i.toString();
                          if (i < 10) {
                            pairKey = pairKey.padLeft(2, '0');
                          }
                          if (global.numberPair[pairKey]! > 0) {
                            global.numberPair[pairKey] =
                                (global.numberPair[pairKey]! -
                                        (selectPairList[pairKey]! * patti))
                                    .toInt();
                          }
                        }
                      } else {
                        global.numberPair = convertPair(_selectedList);
                      }
                      ref.refresh(numberPairProvider);
                    }),
                  ),
                  SizedBox(
                    width: 5.w,
                  )
                ],
              ),
            ),
            // DesignConfig.flatButtonWithIcon(
            //   ColorsRes.mainBlue,
            //   1.6.w,
            //   Icons.create,
            //   ColorsRes.white,
            //   2.6.w,
            //   'Create',
            //   2.w,
            //   ColorsRes.white,
            // ),
          ],
        ),
      ],
    );
  });
}

Widget clientsList(
    PanelResponseData data,
    ExtraDataParameter extraDataParameter,
    Map<String, int> pair,
    BuildContext context) {
  Map<String, int> result = convertPair(data);
  int total = 0;

  for (int i = 0 * 10; i < 120; i++) {
    String pairKey = (i + 1).toString();
    if (i < 10) {
      pairKey = pairKey.padLeft(2, '0');
    }
    total = total + result[pairKey]!;
  }

  String selected = "";
  return Container(
    margin: EdgeInsets.only(top: 1.w),
    decoration: DesignConfig.boxDecorationContainerCardShadow(
        ColorsRes.white, Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.4.w),
      child: Row(
        children: [
          SizedBox(
            width: 0.5.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/256/4128/4128176.png',
              height: 3.w,
              width: 3.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 0.61.w,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(1.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 1.4.w,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    'Total : $total',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 1.2.w,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Consumer(builder: (_, WidgetRef ref, __) {
            final _dataAgents = ref.watch(agentsDataProvider);

            return Checkbox(
              value: checkBox.contains(data.id) ? true : false,
              onChanged: (value) {
                if (value!) {
                  checkBox.add(data.id!);
                  for (int i = 0; i < global.numberPair.length - 1; i++) {
                    String pairKey = i.toString();
                    if (i < 10) {
                      pairKey = pairKey.padLeft(2, '0');
                    }
                    global.numberPair[pairKey] =
                        global.numberPair[pairKey]! + pair[pairKey]!;
                  }
                  _selectedList = data;
                  selectPairList = global.numberPair;
                } else {
                  checkBox.remove(data.id!);
                  for (int i = 0; i < global.numberPair.length - 1; i++) {
                    String pairKey = i.toString();
                    if (i < 10) {
                      pairKey = pairKey.padLeft(2, '0');
                    }
                    global.numberPair[pairKey] =
                        global.numberPair[pairKey]! - pair[pairKey]!;
                  }
                  _selectedList = data;
                  selectPairList = global.numberPair;
                }

                // checkBox = data.id!;
                // global.numberPair = pair;
                // _selectedList = data;
                // selectPairList = convertPair(data);
                selectedAgents = _dataAgents.value!.data!
                    .where((item) => item.id == data.agentId)
                    .toList()[0];
                print('selectedAgents 0 : ${selectedAgents!.name}');
                ref.refresh(numberPairProvider);
              },
            );
          }),
        ],
      ),
    ),
  );
}

Map<String, int> convertPair(PanelResponseData data) {
  List<String> str = data.pair!
      .replaceAll("{", "")
      .replaceAll("}", "")
      .replaceAll("\"", "")
      .replaceAll("'", "")
      .split(",");
  Map<String, int> result = {};
  for (int i = 0; i < str.length; i++) {
    List<String> s = str[i].split(":");
    result.putIfAbsent((s[0].trim()), () => int.parse(s[1].trim()));
  }
  return result;
}
