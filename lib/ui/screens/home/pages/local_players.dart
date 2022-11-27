import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/data/models/agents_model.dart';
import 'package:sizer/sizer.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/player_limit_popup.dart';

class LocalPlayers extends StatefulWidget {
  @override
  State<LocalPlayers> createState() => _SheetsState();
}

class _SheetsState extends State<LocalPlayers> {
  final List<AgentsModel> agents = [
    AgentsModel(
      id: '1',
      name: 'Cris Evans',
      date: DateTime.now(),
      picture:
          'https://www.soycarmin.com/__export/1658099176495/sites/debate/img/2022/07/17/chris-evans-novia_crop1658098869098.jpg_943222218.jpg',
    ),
    AgentsModel(
      id: '2',
      name: 'Arshad Ahmad',
      date: DateTime.now(),
      picture:
          'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/16407468/2021/12/28/fce7ca1e-01ec-4c12-a90f-c7b75abda0e01640669480687-Difference-of-Opinion-Men-Tshirts-4021640669480120-1.jpg',
    ),
    AgentsModel(
      id: '3',
      name: 'Aeimesh Khan',
      date: DateTime.now(),
      picture:
          'https://image.shutterstock.com/image-photo/casually-handsome-confident-young-man-260nw-439433326.jpg',
    ),
    AgentsModel(
      id: '4',
      name: 'Imran Khan',
      date: DateTime.now(),
      picture:
          'https://www.muscleandfitness.com/wp-content/uploads/2015/08/what_makes_a_man_more_manly_main0.jpg?quality=86&strip=all',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(),
        SizedBox(
          height: 3.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: agents.map((e) {
                  return localPlayersList(e.picture, e.name, e.date, context);
                }).toList(),
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: 1.w),
                padding: EdgeInsets.all(1.5.w),
                decoration: DesignConfig.boxDecorationContainerCardShadow(
                    ColorsRes.white,
                    Color.fromRGBO(44, 39, 46, 0.059),
                    16.0,
                    3,
                    3,
                    20,
                    0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Enter agent name',
                              Icons.person,
                              3.w),
                        ),
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Enter mobile number',
                              Icons.mobile_friendly,
                              3.w),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Password',
                              Icons.monetization_on,
                              3.w),
                        ),
                        Expanded(
                          child: DesignConfig.inputBoxDecorated(
                              const Color(0xFFf9f9f9),
                              1.5.w,
                              2.2.w,
                              'Limit',
                              Icons.monetization_on,
                              3.w),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Card(
                          margin: EdgeInsets.only(right: 1.w),
                          color: ColorsRes.mainBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.6.w)),
                          child: Container(
                            height: 7.w,
                            width: 30.w,
                            alignment: Alignment.center,
                            child: Text(
                              'Add',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ColorsRes.white, fontSize: 2.w),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
            // Expanded(
            //   flex: 3,
            //   child: Column(
            //     children: agents.map((e) {
            //       return localPlayersRequestsList(e.picture, e.name, e.date);
            //     }).toList(),
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}

// Widgets -----------------------------------------------------------------------------------------------------------------------------------------------------------------

Widget topBar() {
  return Row(
    children: [
      SizedBox(
        width: 1.5.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Local Players',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
          ),
          Text(
            'Manage Players',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 1.4.w,
              color: Color.fromARGB(255, 155, 155, 155),
            ),
          )
        ],
      ),
      Expanded(child: Container()),
      Card(
        margin: EdgeInsets.only(left: 2.w),
        color: Color(0xfff9f9f9),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.5.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 1.8.w),
          child: Row(
            children: [
              Text(
                'Select Sheet',
                style: TextStyle(color: ColorsRes.darkGrey, fontSize: 1.7.w),
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
      Card(
        margin: EdgeInsets.only(left: 2.w),
        color: ColorsRes.mainBlue,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.5.w)),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 2.2.w),
            child: Text(
              'Create',
              style: TextStyle(color: ColorsRes.white, fontSize: 1.7.w),
            )),
      ),
    ],
  );
}

Widget localPlayersList(
    String? pic, String? name, DateTime? date, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 1.w),
    decoration: DesignConfig.boxDecorationContainerCardShadow(
        ColorsRes.white, Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 1.w),
      child: Row(
        children: [
          SizedBox(
            width: 0.5.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              pic!,
              height: 5.5.w,
              width: 5.5.w,
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
                Text(
                  'Created On: 20 oct, 2022',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 1.3.w,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
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
              IconlyBold.delete,
              color: ColorsRes.red,
              size: 3.w,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBold.danger,
              color: ColorsRes.yellowColor,
              size: 3.w,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => PlayerLimitPopup(name, pic));
            },
            icon: Icon(
              IconlyBold.editSquare,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget localPlayersRequestsList(String? pic, String? name, DateTime? date) {
  return Container(
    margin: EdgeInsets.only(top: 1.w),
    decoration: DesignConfig.boxDecorationContainerCardShadow(
        ColorsRes.white, Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.2.w, vertical: 1.w),
      child: Row(
        children: [
          SizedBox(
            width: 0.5.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              pic!,
              height: 5.5.w,
              width: 5.5.w,
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
                Text(
                  'Created On: 20 oct, 2022',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 1.3.w,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Card(
            color: Color(0xFFffffff),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.6.w),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
              child: Text(
                'Reject',
                style: TextStyle(fontSize: 1.8.w, color: ColorsRes.red),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Card(
            color: ColorsRes.mainBlue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.6.w),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
              child: Text(
                'Accept',
                style: TextStyle(
                    fontSize: 1.8.w, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
