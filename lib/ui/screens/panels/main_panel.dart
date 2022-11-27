import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ms_sheet/data/models/agents_model.dart';
import 'package:ms_sheet/ui/screens/panels/master_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../styles/design.dart';

class MainPanel extends StatefulWidget {
  const MainPanel({super.key});

  @override
  State<MainPanel> createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  final List<AgentsModel> clients = [
    AgentsModel(
      id: '1',
      name: 'Client 1',
      date: DateTime.now(),
      picture:
          'https://www.soycarmin.com/__export/1658099176495/sites/debate/img/2022/07/17/chris-evans-novia_crop1658098869098.jpg_943222218.jpg',
    ),
    AgentsModel(
      id: '2',
      name: 'Client 2',
      date: DateTime.now(),
      picture:
          'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/16407468/2021/12/28/fce7ca1e-01ec-4c12-a90f-c7b75abda0e01640669480687-Difference-of-Opinion-Men-Tshirts-4021640669480120-1.jpg',
    ),
    AgentsModel(
      id: '3',
      name: 'Client 3',
      date: DateTime.now(),
      picture:
          'https://image.shutterstock.com/image-photo/casually-handsome-confident-young-man-260nw-439433326.jpg',
    ),
    AgentsModel(
      id: '4',
      name: 'Client 4',
      date: DateTime.now(),
      picture:
          'https://www.muscleandfitness.com/wp-content/uploads/2015/08/what_makes_a_man_more_manly_main0.jpg?quality=86&strip=all',
    ),
    AgentsModel(
      id: '5',
      name: 'Client 5',
      date: DateTime.now(),
      picture:
          'https://www.muscleandfitness.com/wp-content/uploads/2015/08/what_makes_a_man_more_manly_main0.jpg?quality=86&strip=all',
    ),
    AgentsModel(
      id: '6',
      name: 'Client 6',
      date: DateTime.now(),
      picture:
          'https://www.muscleandfitness.com/wp-content/uploads/2015/08/what_makes_a_man_more_manly_main0.jpg?quality=86&strip=all',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                            'Faridabad',
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
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              crossAxisCount: 1,
                                              itemCount: 10,
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
                                      return pairList(index, 200, 2600);
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
                          Expanded(child: controls()),
                          Container(
                            width: 25.w,
                          )
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
                      children: clients.map((e) {
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

Widget controls() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: DesignConfig.flatButtonWithIcon(
              ColorsRes.mainBlue,
              1.6.w,
              FontAwesomeIcons.landmark,
              ColorsRes.white,
              2.6.w,
              'Laddi',
              2.w,
              ColorsRes.white,
            ),
          ),
          Expanded(
            child: DesignConfig.flatButtonWithIcon(
              ColorsRes.mainBlue,
              1.6.w,
              FontAwesomeIcons.paste,
              ColorsRes.white,
              2.6.w,
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
              2.6.w,
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
              2.6.w,
              'Cancel',
              2.w,
              ColorsRes.white,
            ),
          ),
          SizedBox(
            width: 0.7.w,
          ),
          SizedBox(
            width: 32.w,
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
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select Client',
                        style:
                            TextStyle(color: ColorsRes.darkGrey, fontSize: 2.w),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
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
                  borderRadius: BorderRadius.circular(1.5.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.7.h,
                  horizontal: 2.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.start,
                        scribbleEnabled: true,
                        style: const TextStyle(
                            color: ColorsRes.mainBlue,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          hintText: 'Enter box no.',
                          isCollapsed: true,
                          contentPadding: EdgeInsets.only(
                              left: 1.2.w, top: 0.5.w, bottom: 0.5.w),
                          hoverColor: ColorsRes.lightBlue,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
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
                  borderRadius: BorderRadius.circular(1.5.w)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.7.h,
                  horizontal: 2.w,
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  scribbleEnabled: true,
                  style: const TextStyle(
                      color: ColorsRes.mainBlue, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    isCollapsed: true,
                    contentPadding:
                        EdgeInsets.only(left: 1.2.w, top: 0.5.w, bottom: 0.5.w),
                    hoverColor: ColorsRes.lightBlue,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),
          DesignConfig.flatButtonWithIcon(
            ColorsRes.mainBlue,
            1.6.w,
            Icons.done,
            ColorsRes.white,
            2.6.w,
            'Enter',
            2.w,
            ColorsRes.white,
          ),
        ],
      ),
    ],
  );
}

Widget pairList(int index, double pair, double amount) {
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
            pair.toString().split(".")[0],
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorsRes.black),
          )),
          Expanded(
              child: Text(
            amount.toString().split(".")[0],
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorsRes.black),
          )),
          IconButton(
            onPressed: () {},
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

Widget clientsList(String? pic, String? name, DateTime? date) {
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
                      'Total : 2500',
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
