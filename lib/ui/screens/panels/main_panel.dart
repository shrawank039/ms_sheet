import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/panel_response_entity.dart';
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:ms_sheet/repositories/panel_repository.dart';
import 'package:ms_sheet/ui/screens/panels/master_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/widgets/laddi_popup.dart';
import 'package:sizer/sizer.dart';

import '../../../models/agents_response_entity.dart';
import '../../../widgets/delete_confirmation_popup.dart';
import '../../styles/design.dart';

bool updatePanel = false;
int selectedAgentId = 0;

class MainPanel extends ConsumerStatefulWidget {
  final int sheet_id;
  final String date;
  const MainPanel(this.sheet_id, this.date, {super.key});

  @override
  ConsumerState<MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends ConsumerState<MainPanel> {
  final FocusNode _focusNode = FocusNode();
  int? entryBox, entryAmt;
  AgentsResponseData? selectedAgents;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController entryBoxController = TextEditingController();
  final TextEditingController entryAmtController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    entryBoxController.dispose();
    entryAmtController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          print('kReleaseMode : arrowUp');
        } else {
          print('kReleaseMode (false) : arrowUp');
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          print('kReleaseMode : arrowDown');
        } else {
          print('kReleaseMode (false) : arrowDown');
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      setState(() {
        if (kReleaseMode) {
          print('kReleaseMode : arrowLeft');
        } else {
          print('kReleaseMode (false) : arrowLeft');
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      setState(() {
        if (kReleaseMode) {
          print('kReleaseMode : arrowRight');
        } else {
          print('kReleaseMode (false) : arrowRight');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ExtraDataParameter extraDataParameter =
        ExtraDataParameter(dataList: [widget.sheet_id, widget.date]);

    final _data = ref.watch(panelDataProvider(extraDataParameter));
    final _dataAgents = ref.watch(agentsDataProvider);
    final _dataNumberPair = ref.watch(numberPairProvider);

    print('${widget.sheet_id} and ${widget.date}');

    var total = 0;
    for (int i = 0; i < global.numberPair.length; i++) {
      total += global.numberPair[i]!;
    }

    return Scaffold(
      body: SafeArea(
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: _focusNode,
          onKey: _handleKeyEvent,
          child: Padding(
            padding: EdgeInsets.all(1.5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                              'Delhi',
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
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AlignedGridView.count(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          crossAxisCount: 10,
                                          itemCount: 100,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                          itemBuilder: (context, index) {
                                            // print(
                                            //     '_dataNumberPair 0 : ${_dataNumberPair}');
                                            return numberBox(index);
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
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                crossAxisCount: 1,
                                                itemCount: 10,
                                                mainAxisSpacing: 0,
                                                crossAxisSpacing: 0,
                                                itemBuilder: (context, index) {
                                                  int total = 0;
                                                  for (int i = index * 10;
                                                      i < index * 10 + 10;
                                                      i++) {
                                                    total = total +
                                                        global.numberPair[i]!;
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
                                  /*SizedBox(
                                    height: 2.w,
                                  ),*/
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AlignedGridView.count(
                                          shrinkWrap: true,
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
                                                scrollDirection: Axis.vertical,
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
                                                            i + 100]!;
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
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        width: 9.w,
                                        alignment: Alignment.centerLeft,
                                        height: 5.5.w,
                                        child: Text(
                                          "$total",
                                          style: TextStyle(
                                              fontSize: 2.2.w,
                                              color: ColorsRes.mainBlue,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 25.w,
                              child: Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Expanded(
                                              child: Text(
                                            "Pair",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ColorsRes.grayColor),
                                          )),
                                          const Expanded(
                                              child: Text(
                                            "Amount",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ColorsRes.grayColor),
                                          )),
                                          SizedBox(
                                            width: 4.w,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.w,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: global.numberPair.length,
                                      itemBuilder: (context, index) {
                                        return pairList(index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        // Expanded(
                        //   child: SizedBox(
                        //     height: 2.w,
                        //   ),
                        // ),
                        // All buttons to update the sheet
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const LaddiPopup());
                                          },
                                          child:
                                              DesignConfig.flatButtonWithIcon(
                                            ColorsRes.mainBlue,
                                            1.6.w,
                                            FontAwesomeIcons.landmark,
                                            ColorsRes.white,
                                            1.6.w,
                                            'Laddi',
                                            2.w,
                                            ColorsRes.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: DesignConfig.flatButtonWithIcon(
                                          ColorsRes.mainBlue,
                                          1.6.w,
                                          FontAwesomeIcons.paste,
                                          ColorsRes.white,
                                          1.6.w,
                                          'C/P',
                                          2.w,
                                          ColorsRes.white,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if (selectedAgents != null &&
                                              updatePanel == false) {
                                            var addPanel =
                                                await PanelRepository()
                                                    .addPanel(
                                                        widget.sheet_id,
                                                        selectedAgents!.id!,
                                                        widget.date,
                                                        global.numberPair
                                                            .toString());
                                            if (addPanel.success == true) {
                                              SmartDialog.showToast(
                                                  "${selectedAgents!.name} Added");
                                              setState(() {
                                                selectedAgents = null;
                                              });
                                              ref.refresh(panelDataProvider(
                                                  extraDataParameter));
                                            }
                                          } else if (selectedAgents != null &&
                                              updatePanel == true) {
                                            var updatePanel =
                                                await PanelRepository()
                                                    .updatePanel(
                                                        widget.sheet_id,
                                                        selectedAgents!.id!,
                                                        widget.date,
                                                        global.numberPair
                                                            .toString());
                                            if (updatePanel.success == true) {
                                              SmartDialog.showToast(
                                                  "${selectedAgents!.name} Updated");
                                              setState(() {
                                                selectedAgents = null;
                                              });
                                              ref.refresh(panelDataProvider(
                                                  extraDataParameter));
                                            }
                                          } else {
                                            SmartDialog.showToast(
                                                "Fill all the data first!!!");
                                          }
                                        },
                                        child: Container(
                                          child:
                                              DesignConfig.flatButtonWithIcon(
                                            ColorsRes.green,
                                            1.6.w,
                                            FontAwesomeIcons.floppyDisk,
                                            ColorsRes.white,
                                            1.6.w,
                                            'Save',
                                            2.w,
                                            ColorsRes.white,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          global.numberPair = {
                                            00: 0,
                                            01: 0,
                                            02: 0,
                                            03: 0,
                                            04: 0,
                                            05: 0,
                                            06: 0,
                                            07: 0,
                                            08: 0,
                                            09: 0,
                                            10: 0,
                                            11: 0,
                                            12: 0,
                                            13: 0,
                                            14: 0,
                                            15: 0,
                                            16: 0,
                                            17: 0,
                                            18: 0,
                                            19: 0,
                                            20: 0,
                                            21: 0,
                                            22: 0,
                                            23: 0,
                                            24: 0,
                                            25: 0,
                                            26: 0,
                                            27: 0,
                                            28: 0,
                                            29: 0,
                                            30: 0,
                                            31: 0,
                                            32: 0,
                                            33: 0,
                                            34: 0,
                                            35: 0,
                                            36: 0,
                                            37: 0,
                                            38: 0,
                                            39: 0,
                                            40: 0,
                                            41: 0,
                                            42: 0,
                                            43: 0,
                                            44: 0,
                                            45: 0,
                                            46: 0,
                                            47: 0,
                                            48: 0,
                                            49: 0,
                                            50: 0,
                                            51: 0,
                                            52: 0,
                                            53: 0,
                                            54: 0,
                                            55: 0,
                                            56: 0,
                                            57: 0,
                                            58: 0,
                                            59: 0,
                                            60: 0,
                                            61: 0,
                                            62: 0,
                                            63: 0,
                                            64: 0,
                                            65: 0,
                                            66: 0,
                                            67: 0,
                                            68: 0,
                                            69: 0,
                                            70: 0,
                                            71: 0,
                                            72: 0,
                                            73: 0,
                                            74: 0,
                                            75: 0,
                                            76: 0,
                                            77: 0,
                                            78: 0,
                                            79: 0,
                                            80: 0,
                                            81: 0,
                                            82: 0,
                                            83: 0,
                                            84: 0,
                                            85: 0,
                                            86: 0,
                                            87: 0,
                                            88: 0,
                                            89: 0,
                                            90: 0,
                                            91: 0,
                                            92: 0,
                                            93: 0,
                                            94: 0,
                                            95: 0,
                                            96: 0,
                                            97: 0,
                                            98: 0,
                                            99: 0,
                                            100: 0,
                                            101: 0,
                                            102: 0,
                                            103: 0,
                                            104: 0,
                                            105: 0,
                                            106: 0,
                                            107: 0,
                                            108: 0,
                                            109: 0,
                                            110: 0,
                                            111: 0,
                                            112: 0,
                                            113: 0,
                                            114: 0,
                                            115: 0,
                                            116: 0,
                                            117: 0,
                                            118: 0,
                                            119: 0,
                                            120: 0,
                                          };
                                          updatePanel = false;
                                          selectedAgents = null;
                                          ref.refresh(numberPairProvider);
                                        },
                                        child: Container(
                                          child:
                                              DesignConfig.flatButtonWithIcon(
                                            ColorsRes.red,
                                            1.6.w,
                                            FontAwesomeIcons.xmark,
                                            ColorsRes.white,
                                            1.6.w,
                                            'Cancel',
                                            2.w,
                                            ColorsRes.white,
                                          ),
                                        ),
                                      ),
                                      Card(
                                        margin: EdgeInsets.only(
                                            left: 1.w, right: 1.w, top: 1.w),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.5.w)),
                                        elevation: 0,
                                        color: const Color(0xFFf9f9f9),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Consumer(
                                            builder: (BuildContext context,
                                                WidgetRef ref, Widget? child) {
                                              return _data.when(
                                                  data: (dynamic data) {
                                                if (updatePanel) {
                                                  selectedAgents = _dataAgents
                                                      .value!.data!
                                                      .where((item) =>
                                                          item.id ==
                                                          selectedAgentId)
                                                      .toList()[0];
                                                  print(
                                                      'DropdownButton2 0 : ${selectedAgents}');
                                                }
                                                return DropdownButtonHideUnderline(
                                                  child: DropdownButton2(
                                                    dropdownDecoration:
                                                        BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: const Color(
                                                          0xFFf9f9f9),
                                                    ),
                                                    isExpanded: false,
                                                    hint: Text(
                                                      'Select Client',
                                                      style: TextStyle(
                                                        fontSize: 2.2.w,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 174, 174, 174),
                                                      ),
                                                    ),
                                                    items: _dataAgents
                                                        .value?.data!
                                                        .map((item) =>
                                                            DropdownMenuItem<
                                                                AgentsResponseData>(
                                                              value: item,
                                                              child: Text(
                                                                item.name
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    value: selectedAgents,
                                                    onChanged: updatePanel
                                                        ? null
                                                        : (value) {
                                                            setState(() {
                                                              selectedAgents = value
                                                                  as AgentsResponseData?;
                                                            });
                                                          },
                                                    //itemHeight: 40,
                                                    //dropdownMaxHeight: 300,
                                                    searchController:
                                                        textEditingController,
                                                    searchInnerWidget: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 8,
                                                        bottom: 4,
                                                        right: 8,
                                                        left: 8,
                                                      ),
                                                      child: TextFormField(
                                                        controller:
                                                            textEditingController,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          // contentPadding: const EdgeInsets.symmetric(
                                                          //   horizontal: 10,
                                                          //   vertical: 8,
                                                          // ),
                                                          hintText:
                                                              'Search for clients...',
                                                          hintStyle:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    searchMatchFn:
                                                        (item, searchValue) {
                                                      return (item.value
                                                          .toString()
                                                          .contains(
                                                              searchValue));
                                                    },
                                                    //This to clear the search value when you close the menu
                                                    onMenuStateChange:
                                                        (isOpen) {
                                                      if (!isOpen) {
                                                        textEditingController
                                                            .clear();
                                                      }
                                                    },
                                                  ),
                                                );
                                              }, error: (Object error,
                                                      StackTrace stackTrace) {
                                                return Text('Error');
                                              }, loading: () {
                                                return CircularProgressIndicator();
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 1.2.w,
                                      ),
                                      Expanded(
                                        child: Card(
                                          color: ColorsRes.lightWeightColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1.5.w)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 0.7.h,
                                              horizontal: 2.w,
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    controller:
                                                        entryBoxController,
                                                    textAlign: TextAlign.start,
                                                    scribbleEnabled: true,
                                                    style: const TextStyle(
                                                        color:
                                                            ColorsRes.mainBlue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter box no.',
                                                      isCollapsed: true,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 1.2.w,
                                                              top: 0.5.w,
                                                              bottom: 0.5.w),
                                                      hoverColor:
                                                          ColorsRes.lightBlue,
                                                      border:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 20.w,
                                        child: Card(
                                          color: ColorsRes.lightWeightColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1.5.w)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 0.7.h,
                                              horizontal: 2.w,
                                            ),
                                            child: TextField(
                                              controller: entryAmtController,
                                              textAlign: TextAlign.start,
                                              scribbleEnabled: true,
                                              style: const TextStyle(
                                                  color: ColorsRes.mainBlue,
                                                  fontWeight: FontWeight.w500),
                                              decoration: InputDecoration(
                                                hintText: 'Amount',
                                                isCollapsed: true,
                                                contentPadding: EdgeInsets.only(
                                                    left: 1.2.w,
                                                    top: 0.5.w,
                                                    bottom: 0.5.w),
                                                hoverColor: ColorsRes.lightBlue,
                                                border:
                                                    const OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (entryBoxController
                                              .text.length.isEven) {
                                            for (int i = 0;
                                                i <
                                                    entryBoxController
                                                        .text.length;
                                                i++) {
                                              entryBox = int.parse(
                                                  entryBoxController.text[i] +
                                                      entryBoxController
                                                          .text[i + 1]);
                                              entryAmt = int.parse(
                                                  entryAmtController.text);
                                              global.numberPair[entryBox!] =
                                                  (global.numberPair[
                                                          entryBox])! +
                                                      entryAmt!;
                                              i = i + 1;
                                            }
                                          } else {
                                            for (int i = 0;
                                                i <
                                                    entryBoxController
                                                        .text.length;
                                                i++) {
                                              entryBox = int.parse(
                                                  entryBoxController.text[i] +
                                                      entryBoxController
                                                          .text[i + 1] +
                                                      entryBoxController
                                                          .text[i + 2]);
                                              entryAmt = int.parse(
                                                  entryAmtController.text);
                                              global.numberPair[entryBox!] =
                                                  (global.numberPair[
                                                          entryBox])! +
                                                      entryAmt!;
                                              i = i + 2;
                                            }
                                          }
                                          ref.refresh(numberPairProvider);
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 40.w,
                  padding: EdgeInsets.only(left: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '  Clients',
                        textAlign: TextAlign.start,
                      ),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return _data.when(data: (dynamic data) {
                            print(
                                'agentsDataProvider 0 : ${_data.value!.data}');
                            return Column(
                              children: _data.value!.data!.map((e) {
                                return clientsList(
                                    e, extraDataParameter, context);
                              }).toList(),
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return Text('Error');
                          }, loading: () {
                            return CircularProgressIndicator();
                          });
                        },
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 2.w,
                      )),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1.w),
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
                                children: [
                                  DesignConfig.flatButtonWithIcon(
                                    ColorsRes.lightBlue,
                                    1.6.w,
                                    FontAwesomeIcons.print,
                                    ColorsRes.mainBlue,
                                    2.6.w,
                                    'Print',
                                    2.w,
                                    ColorsRes.mainBlue,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MasterPanel(0, '')));
                                    },
                                    child: DesignConfig.flatButtonWithIcon(
                                      ColorsRes.mainBlue,
                                      1.6.w,
                                      FontAwesomeIcons.book,
                                      ColorsRes.white,
                                      2.6.w,
                                      'Master',
                                      2.w,
                                      ColorsRes.white,
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
  if (global.numberPair[index + 1]! > 0) {
    pointController.text = global.numberPair[index + 1].toString();
  }
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
          controller: pointController,
          textAlign: TextAlign.end,
          scribbleEnabled: true,
          style:
              TextStyle(color: ColorsRes.mainBlue, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding:
                EdgeInsets.only(left: 1.2.w, top: 0.5.w, bottom: 0.5.w),
            hoverColor: ColorsRes.lightBlue,
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ],
    ),
  );
}

Widget pairList(int index) {
  for (int i = index; i < 121; i++) {
    if (global.numberPair[i]! > 0) {
      return Container(
        height: 5.5.w,
        decoration: DesignConfig.boxDecorationContainerCardShadow(
          ColorsRes.white,
          Color.fromRGBO(44, 39, 46, 0.059),
          8.0,
          3,
          3,
          10,
          0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                i.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorsRes.black),
              )),
              Expanded(
                  child: Text(
                global.numberPair[i].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorsRes.black),
              )),
              Consumer(builder: (_, WidgetRef ref, __) {
                return IconButton(
                  onPressed: () {
                    print('deletePair : ${index}');
                    global.numberPair[index] = 0;
                    ref.refresh(numberPairProvider);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 2.7.w,
                    color: ColorsRes.red,
                  ),
                );
              })
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
  return const SizedBox();
}

Widget clientsList(PanelResponseData data,
    ExtraDataParameter extraDataParameter, BuildContext context) {
  return Container(
    width: 50.w,
    margin: EdgeInsets.only(top: 1.w),
    decoration: DesignConfig.boxDecorationContainerCardShadow(
        ColorsRes.white, Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.8.w),
      child: Row(
        children: [
          SizedBox(
            width: 0.5.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/256/4128/4128176.png',
              height: 5.w,
              width: 5.w,
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
                Row(
                  children: [
                    Text(
                      'Pair: 90/0',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 1.3.w,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'Total : 1750',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 1.3.w,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => DeleteConfirmationPopup(
                      data.id!, 'panel', extraDataParameter));
            },
            icon: Icon(
              Icons.delete,
              color: ColorsRes.red,
              size: 3.w,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              return IconButton(
                onPressed: () {
                  List<String> str = data.pair!
                      .replaceAll("{", "")
                      .replaceAll("}", "")
                      .replaceAll("\"", "")
                      .replaceAll("'", "")
                      .split(",");
                  Map<int, int> result = {};
                  for (int i = 0; i < str.length; i++) {
                    List<String> s = str[i].split(":");
                    result.putIfAbsent(
                        int.parse(s[0].trim()), () => int.parse(s[1].trim()));
                  }
                  global.numberPair = result;
                  selectedAgentId = data.agentId!;
                  updatePanel = true;
                  ref.refresh(numberPairProvider);
                },
                icon: Icon(
                  Icons.edit_note,
                  color: ColorsRes.mainBlue,
                  size: 3.w,
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
