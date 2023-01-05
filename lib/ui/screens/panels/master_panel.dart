import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../../models/panel_response_entity.dart';
import '../../../providers/data_providers.dart';
import '../../styles/design.dart';

var _selectedList;
var checkBox;

class MasterPanel extends ConsumerStatefulWidget {
  final int sheet_id;
  final String date;

  const MasterPanel(this.sheet_id, this.date, {super.key});

  @override
  ConsumerState<MasterPanel> createState() => _MasterPanelState();
}

class _MasterPanelState extends ConsumerState<MasterPanel> {
  @override
  Widget build(BuildContext context) {
    final ExtraDataParameter extraDataParameter =
        ExtraDataParameter(dataList: [widget.sheet_id, widget.date]);

    final _data = ref.watch(panelDataProvider(extraDataParameter));

    final _dataNumberPair = ref.watch(numberPairProvider);

    var total = 0;
    for (int i = 0; i < global.numberPair.length; i++) {
      total += global.numberPair[i]!;
    }

    return Scaffold(
      body: SafeArea(
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
                            ' Delhi - Nov 27, 2022',
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
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
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
                                          padding: EdgeInsets.all(1.w),
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
                                // SizedBox(
                                //   height: 1.w,
                                // ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AlignedGridView.count(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
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
                                                      global
                                                          .numberPair[i + 100]!;
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
                                fontWeight: FontWeight.w400),
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
                                  fontWeight: FontWeight.w600),
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
                width: 70.w,
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
                                  builder: (BuildContext context, WidgetRef ref,
                                      Widget? child) {
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
                                    }, error:
                                        (Object error, StackTrace stackTrace) {
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
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          /*Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '  Local',
                                  textAlign: TextAlign.start,
                                ),
                                Column(
                                  children: global.clients.map((e) {
                                    return clientsList(
                                        e.picture, e.name, e.date);
                                  }).toList(),
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '  Counter',
                                  textAlign: TextAlign.start,
                                ),
                                Column(
                                  children: global.clients.map((e) {
                                    return clientsList(
                                        e.picture, e.name, e.date);
                                  }).toList(),
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 2.w,
                                )),
                              ],
                            ),
                          ),*/
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.2.w),
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
                                Expanded(
                                  child: Card(
                                    margin: EdgeInsets.only(left: 2.w),
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
                                            FontAwesomeIcons.share,
                                            color: ColorsRes.mainBlue,
                                            size: 3.w,
                                          ),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Text(
                                            'Share',
                                            style: TextStyle(
                                              color: ColorsRes.mainBlue,
                                              fontSize: 2.w,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    margin: EdgeInsets.only(left: 2.w),
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
                                            FontAwesomeIcons.whatsapp,
                                            color: ColorsRes.mainBlue,
                                            size: 3.w,
                                          ),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Text(
                                            'Share',
                                            style: TextStyle(
                                              color: ColorsRes.mainBlue,
                                              fontSize: 2.w,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    margin: EdgeInsets.only(left: 2.w),
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
                                            size: 3.w,
                                          ),
                                          SizedBox(
                                            width: 1.h,
                                          ),
                                          Text(
                                            'Generate',
                                            style: TextStyle(
                                              color: ColorsRes.mainBlue,
                                              fontSize: 2.w,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                )
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
    );
  }
}

Widget numberBox(int index) {
  final TextEditingController pointController = TextEditingController();

  if (global.numberPair[index + 1]! > 0) {
    pointController.text = global.numberPair[index + 1].toString();
  }
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
            textAlign: TextAlign.end,
            scribbleEnabled: true,
            controller: pointController,
            style: const TextStyle(
                color: ColorsRes.mainBlue, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding:
                  EdgeInsets.only(left: 1.2.w, top: 0.5.w, bottom: 0.5.w),
              hoverColor: ColorsRes.lightBlue,
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              global.numberPair[index] = int.parse(value);
              print('onChanged ${global.numberPair[index]}');
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
                  for (int i = 0; i < global.numberPair.length; i++) {
                    if (global.numberPair[i]! > 0) {
                      global.numberPair[i] =
                          (global.numberPair[i]! - int.parse(value));
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
                  for (int i = 0; i < global.numberPair.length; i++) {
                    if (global.numberPair[i]! >= int.parse(value)) {
                      global.numberPair[i] =
                          (global.numberPair[i]! - int.parse(value));
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
                    value = '0';
                  }
                  global.numberPair = convertPair(_selectedList);
                  for (int i = 0; i < global.numberPair.length; i++) {
                    if (global.numberPair[i]! > 0) {
                      int percent = int.parse(value);
                      var finalValue = (global.numberPair[i]! * percent) / 100;
                      global.numberPair[i] = finalValue.toInt();
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
                    value = '0';
                  }
                  global.numberPair = convertPair(_selectedList);
                  for (int i = 0; i < global.numberPair.length; i++) {
                    if (global.numberPair[i]! >= int.parse(value)) {
                      global.numberPair[i] = 0;
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
                  for (int i = 0; i < global.numberPair.length; i++) {
                    if (global.numberPair[i]! <= int.parse(value)) {
                      global.numberPair[i] = 0;
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
                    ),
                  ),
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                      ColorsRes.lightBlue,
                      1.5.w,
                      ColorsRes.mainBlue,
                      "In/Out",
                      2.w,
                      ColorsRes.mainBlue,
                    ),
                  ),
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                      ColorsRes.lightBlue,
                      1.5.w,
                      ColorsRes.mainBlue,
                      "Comm",
                      2.w,
                      ColorsRes.mainBlue,
                    ),
                  ),
                  Expanded(
                    child: DesignConfig.flatButtonWithCheckBox(
                      ColorsRes.lightBlue,
                      1.5.w,
                      ColorsRes.mainBlue,
                      "Patti",
                      2.w,
                      ColorsRes.mainBlue,
                    ),
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
    Map<int, int> pair,
    BuildContext context) {
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
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  Text(
                    'Total : 1200',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 1.2.w,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
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
            return Checkbox(
              value: checkBox == data.id ? true : false,
              onChanged: (value) {
                checkBox = data.id!;
                global.numberPair = pair;
                _selectedList = data;
                print('agentsDataProvider 0 : ${global.numberPair}');
                ref.refresh(numberPairProvider);
              },
            );
          }),
        ],
      ),
    ),
  );
}

Map<int, int> convertPair(PanelResponseData data) {
  List<String> str = data.pair!
      .replaceAll("{", "")
      .replaceAll("}", "")
      .replaceAll("\"", "")
      .replaceAll("'", "")
      .split(",");
  Map<int, int> result = {};
  for (int i = 0; i < str.length; i++) {
    List<String> s = str[i].split(":");
    result.putIfAbsent(int.parse(s[0].trim()), () => int.parse(s[1].trim()));
  }
  return result;
}
