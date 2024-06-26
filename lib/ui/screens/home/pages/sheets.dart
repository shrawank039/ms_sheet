import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ms_sheet/models/sheets_response_entity.dart';
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:ms_sheet/ui/screens/panels/main_panel.dart';
import 'package:ms_sheet/ui/screens/panels/master_panel.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/declare_popup.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sizer/sizer.dart';
import 'package:ms_sheet/global.dart' as global;
import '../../../../repositories/sheets_repository.dart';
import '../../login/login_screen.dart';

List<dynamic> _sheetsList = [];
DateTime now = DateTime.now();
String dateToday = DateFormat.yMMMd('en_US').format(now);
String dateOnly = DateFormat('yyyy-MM-dd').format(now);

class Sheets extends ConsumerStatefulWidget {
  const Sheets({super.key});

  @override
  ConsumerState<Sheets> createState() => _SheetsState();
}

class _SheetsState extends ConsumerState<Sheets> {
  @override
  void initState() {
    super.initState();
    getSheets();
  }

  void getSheets() async {
    _sheetsList.clear();
    var getSheets = await SheetsRepository().getSheetsHome();
    if (getSheets.success == true) {
    } else {
      // ignore: use_build_context_synchronously
       Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
          (route) => false,//if you want to disable back feature set to false
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(sheetHomeDataProvider);

    return Consumer(
      builder: (BuildContext contex, WidgetRef ref, Widget? child) {
        return _data.when(data: (dynamic data) {
          print('agentsDataProvider r0 : ${_data.value!.data}');

          if (_data.value!.success == true) {
            _sheetsList.clear();
            _sheetsList.addAll(_data.value!.data!);
          }
          return Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Mobile = Small (smaller than 640px)
                // Tablet = Medium (641px to 1007px)
                // Laptop = Large (1008px and larger)
                if (constraints.maxWidth < 640) {
                  return SheetsMobile();
                } else {
                  return SheetsPC();
                }
              },
            ),
          );
        }, error: (Object error, StackTrace stackTrace) {
          return Text('Error');
        }, loading: () {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.grey,
              size: 40,
            ),
          );
        });
      },
    );
  }
}

class SheetsPC extends StatefulWidget {
  const SheetsPC({super.key});

  @override
  State<SheetsPC> createState() => _SheetsPCState();
}

class _SheetsPCState extends State<SheetsPC> {

 late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String text) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SheetsCreateSection(),
        SizedBox(
          height: 4.w,
        ),
        Expanded(
          child: ResponsiveGridList(
              squareCells: false,
              scroll: true,
              shrinkWrap: true,
              rowMainAxisAlignment: MainAxisAlignment.start,
              desiredItemWidth: 38.w,
              minSpacing: 10,
              children: _sheetsList.map((e) {
                return SheetsCardPC(e, context);
              }).toList()),
        )
      ],
    );
  }
}

class SheetsMobile extends StatefulWidget {
  const SheetsMobile({super.key});

  @override
  State<SheetsMobile> createState() => _SheetsMobileState();
}

class _SheetsMobileState extends State<SheetsMobile> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 3.w,
        ),
        SheetsCreateSection(),
        SizedBox(
          height: 2.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 3.w),
              child: Text(
                'Recent Sheets',
                style: TextStyle(
                    color: ColorsRes.lightGrey,
                    fontSize: 3.4.w,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.w,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return SheetsCardMoile();
                }),
          ),
        ),
      ],
    );
  }
}

Widget SheetsCardPC(SheetsResponseData data, BuildContext context) {
  return Container(
    decoration: DesignConfig.boxDecorationContainerCardShadow(ColorsRes.white,
        const Color.fromARGB(15, 28, 12, 34), 12.0, 3, 3, 20, 0),
    //  height: 30.w,
    alignment: const Alignment(0, 0),
    child: Padding(
      padding: EdgeInsets.all(2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/sheetsButtonActive.png',
                height: 4.w,
                width: 4.w,
                fit: BoxFit.fitWidth,
              ),
              Expanded(child: Container()),
              DesignConfig.flatButtonWithIcon(
                ColorsRes.lightGreen,
                1.4.w,
                Icons.airplane_ticket,
                ColorsRes.green,
                2.3.w,
                data.refreshedAt!,
                1.6.w,
                ColorsRes.green,
              )
            ],
          ),
          SizedBox(
            height: 2.4.w,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.name!,
                      style: TextStyle(
                          color: ColorsRes.black,
                          fontSize: 2.0.w,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Last Time: ${data.endTime}',
                      style: TextStyle(
                        color: ColorsRes.lightGrey,
                        fontSize: 1.6.w,
                      ),
                    ),
                  ],
                ),
                Text(
                  data.declared_result == null ? '' : data.declared_result!,
                  style: TextStyle(
                      color: ColorsRes.black,
                      fontSize: 4.0.w,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.w,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (global.prefs.get('type') == 'admin') {
                        showDialog(
                            context: context,
                            builder: (context) => DeclarePopup(
                                data.id!, data.declared_result.toString()));
                                }else{
                            //_showToast('You don\'t have permission.');
                          }
                      },
                      child: DesignConfig.flatButton(
                        ColorsRes.lightBlue,
                        1.4.w,
                        'Declare',
                        1.8.w,
                        ColorsRes.mainBlue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MasterPanel(
                                  data.id!, data.name!, data.refreshedAt!),
                            ));
                      },
                      child: DesignConfig.flatButton(
                        ColorsRes.lightBlue,
                        1.4.w,
                        'Master',
                        1.8.w,
                        ColorsRes.mainBlue,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (data.declared_status == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPanel(
                                      data.id!, data.name!, data.refreshedAt!),
                                ));
                          }
                        },
                        child: DesignConfig.flatButton(
                          ColorsRes.mainBlue,
                          1.4.w,
                          'E-Panel',
                          1.8.w,
                          ColorsRes.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

class SheetsCardMoile extends StatefulWidget {
  const SheetsCardMoile({super.key});

  @override
  State<SheetsCardMoile> createState() => _SheetsCardMoileState();
}

class _SheetsCardMoileState extends State<SheetsCardMoile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.w, left: 1.5.w, right: 1.w),
      decoration: DesignConfig.boxDecorationContainerCardShadow(
          ColorsRes.white, Color.fromARGB(15, 28, 12, 34), 12.0, 3, 3, 20, 0),
      //  height: 30.w,
      alignment: const Alignment(0, 0),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  IconlyBroken.category,
                  color: ColorsRes.mainBlue,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NEW DELHI',
                      style: TextStyle(
                          color: ColorsRes.black,
                          fontSize: 3.5.w,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Last Time: 11:00pm',
                      style: TextStyle(
                        color: ColorsRes.lightGrey,
                        fontSize: 2.8.w,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                DesignConfig.flatButtonWithIcon(
                  ColorsRes.lightGreen,
                  3.w,
                  Icons.airplane_ticket,
                  ColorsRes.green,
                  5.w,
                  '11-03-2022',
                  3.2.w,
                  ColorsRes.green,
                )
              ],
            ),
            SizedBox(
              height: 2.4.w,
            ),
            SizedBox(
              height: 1.5.w,
            ),
            Row(
              children: [
                DesignConfig.flatButton(
                  ColorsRes.lightBlue,
                  2.5.w,
                  'Declare',
                  3.8.w,
                  ColorsRes.mainBlue,
                ),
                DesignConfig.flatButton(
                  ColorsRes.lightBlue,
                  2.5.w,
                  'Master',
                  3.8.w,
                  ColorsRes.mainBlue,
                ),
                Expanded(
                  child: DesignConfig.flatButton(
                    ColorsRes.mainBlue,
                    2.5.w,
                    'E-Panel',
                    3.8.w,
                    ColorsRes.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SheetsCreateSection extends ConsumerStatefulWidget {
  const SheetsCreateSection({super.key});

  @override
  ConsumerState<SheetsCreateSection> createState() =>
      _SheetsCreateSectionState();
}

class _SheetsCreateSectionState extends ConsumerState<SheetsCreateSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile = Small (smaller than 640px)
        // Tablet = Medium (641px to 1007px)
        // Laptop = Large (1008px and larger)
        if (constraints.maxWidth < 640) {
          return Row(
            children: [
              // Expanded(
              //   child: Card(
              //     color: ColorsRes.white,
              //     elevation: 0,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(2.5.w)),
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(
              //           vertical: 1.2.h, horizontal: 3.8.w),
              //       child: Row(
              //         children: [
              //           Expanded(
              //             child: Text(
              //               'Select Sheet',
              //               style: TextStyle(
              //                   color: ColorsRes.darkGrey, fontSize: 3.5.w),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 8.w,
              //           ),
              //           Icon(Icons.arrow_drop_down),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Card(
                margin: EdgeInsets.only(left: 2.w),
                color: ColorsRes.mainBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5.w)),
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 5.w),
                    child: Text(
                      'Create',
                      style: TextStyle(color: ColorsRes.white, fontSize: 3.5.w),
                    )),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              SizedBox(
                width: 1.5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Sheets',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
                  ),
                  Text(
                    'Created by you',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 1.3.w,
                      color: Color.fromARGB(255, 155, 155, 155),
                    ),
                  )
                ],
              ),
              Expanded(child: Container()),
              // Card(
              //   margin: EdgeInsets.only(left: 2.w),
              //   color: Color(0xfff9f9f9),
              //   elevation: 0,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(1.5.w)),
              //   child: Padding(
              //     padding:
              //         EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 1.8.w),
              //     child: Row(
              //       children: [
              //         Text(
              //           'Select Sheet',
              //           style: TextStyle(
              //               color: ColorsRes.darkGrey, fontSize: 1.7.w),
              //         ),
              //         SizedBox(
              //           width: 8.w,
              //         ),
              //         Icon(Icons.arrow_drop_down),
              //       ],
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () async {
                  var refreshSheet = await SheetsRepository().refreshSheets();
                  if (refreshSheet.success == true) {
                    ref.refresh(sheetHomeDataProvider);
                  }
                  //  Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (context) => PipScreen(
                  //                             )));
                },
                child: Card(
                  margin: EdgeInsets.only(left: 2.w),
                  color: ColorsRes.mainBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5.w)),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.7.h, horizontal: 2.2.w),
                      child: Text(
                        'Create',
                        style:
                            TextStyle(color: ColorsRes.white, fontSize: 1.7.w),
                      )),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
