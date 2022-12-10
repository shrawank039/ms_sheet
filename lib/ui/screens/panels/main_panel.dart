import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/ui/screens/panels/master_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/widgets/laddi_popup.dart';
import 'package:sizer/sizer.dart';

import '../../../global.dart';
import '../../../main.dart';
import '../../styles/design.dart';

class MainPanel extends ConsumerStatefulWidget {
  const MainPanel({super.key});

  @override
  ConsumerState<MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends ConsumerState<MainPanel> {
  String? selectedValue;
  int? entryBox, entryAmt;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(counterProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(1.5.w),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 1.w, left: 3.w, right: 3.w, bottom: 2.5.w),
                  //width: 30.w,
                  //height: 200,
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
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
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

                                // SizedBox(
                                //   height: 2.w,
                                // ),
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
                                                return Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  height: 5.5.w,
                                                  child: Text(
                                                    "0",
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
                                      //height: 5.5.w,
                                      child: Text(
                                        "0",
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
                                  AlignedGridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 1,
                                    itemCount: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 0,
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
                      Expanded(
                        child: SizedBox(
                          height: 2.w,
                        ),
                      ),
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
                                        child: DesignConfig.flatButtonWithIcon(
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
                                    Expanded(
                                      child: DesignConfig.flatButtonWithIcon(
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
                                    Expanded(
                                      child: DesignConfig.flatButtonWithIcon(
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
                                    Card(
                                      margin: EdgeInsets.only(
                                          left: 1.w, right: 1.w, top: 2.w),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.5.w)),
                                      elevation: 0,
                                      color: const Color(0xFFf9f9f9),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color(0xFFf9f9f9),
                                            ),
                                            isExpanded: false,
                                            hint: Text(
                                              'Select Client',
                                              style: TextStyle(
                                                fontSize: 5.0.sp,
                                                color: const Color.fromARGB(
                                                    255, 174, 174, 174),
                                              ),
                                            ),
                                            items: clients
                                                .map((item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item.name,
                                                      child: Text(
                                                        item.name.toString(),
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            value: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value as String;
                                              });
                                            },
                                            itemHeight: 40,
                                            dropdownMaxHeight: 300,
                                            searchController:
                                                textEditingController,
                                            searchInnerWidget: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                bottom: 4,
                                                right: 8,
                                                left: 8,
                                              ),
                                              child: TextFormField(
                                                controller:
                                                    textEditingController,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  // contentPadding: const EdgeInsets.symmetric(
                                                  //   horizontal: 10,
                                                  //   vertical: 8,
                                                  // ),
                                                  hintText:
                                                      'Search for sheets...',
                                                  hintStyle: const TextStyle(
                                                      fontSize: 12),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            searchMatchFn: (item, searchValue) {
                                              return (item.value
                                                  .toString()
                                                  .contains(searchValue));
                                            },
                                            //This to clear the search value when you close the menu
                                            onMenuStateChange: (isOpen) {
                                              if (!isOpen) {
                                                textEditingController.clear();
                                              }
                                            },
                                          ),
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
                                                      color: ColorsRes.mainBlue,
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
                                              border: const OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
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
                                                (global.numberPair[entryBox])! +
                                                    entryAmt!;
                                            i = i + 1;
                                          }
                                        });
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
                    Text(
                      '  Clients',
                      textAlign: TextAlign.start,
                    ),
                    Column(
                      children: global.clients.map((e) {
                        return clientsList(e.picture, e.name, e.date);
                      }).toList(),
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
                                                MasterPanel()));
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
    );
  }
}

Widget numberBox(int index) {
  final TextEditingController amtBoxController = TextEditingController();
  if (global.numberPair[index + 1]! > 0) {
    amtBoxController.text = global.numberPair[index + 1].toString();
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
          controller: amtBoxController,
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
  for (int i = 0; i < 101; i++) {
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
              IconButton(
                onPressed: () {
                  print('del $index');
                },
                icon: Icon(
                  Icons.delete,
                  size: 2.7.w,
                  color: ColorsRes.red,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
  return const SizedBox();
}

Widget clientsList(String? pic, String? name, String? date) {
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
              pic!,
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
                  name!,
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
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: ColorsRes.red,
              size: 3.w,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_note,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}
