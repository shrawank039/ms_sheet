import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:sizer/sizer.dart';

import '../../../../../repositories/sheets_repository.dart';
import '../../../../styles/design.dart';
import '../../../panels/main_panel.dart';

class AddSheets extends StatefulWidget {
  const AddSheets({super.key});

  @override
  State<AddSheets> createState() => _AddSheetsState();
}

class _AddSheetsState extends State<AddSheets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            CreateSheets(),
          ],
        ),
      ],
    );
  }
}

class CreateSheets extends ConsumerStatefulWidget {
  const CreateSheets({super.key});

  @override
  ConsumerState<CreateSheets> createState() => _CreateSheetsState();
}

class _CreateSheetsState extends ConsumerState<CreateSheets> {
  late TextEditingController _controllerTime;
  late TextEditingController _controllerName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerTime = TextEditingController(text: '');
    _controllerName = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(sheetDataProvider);
    return Expanded(
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
          children: [
            Padding(
              padding: EdgeInsets.only(left: 1.0.w, right: 1.w),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorsRes.darkGrey,
                        size: 2.8.w,
                      )),
                  Text(
                    'Add Sheet',
                    style:
                        TextStyle(color: ColorsRes.darkGrey, fontSize: 2.0.w),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
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
                        controller: _controllerName,
                        style: TextStyle(
                            fontSize: 2.3.w,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.title,
                            color: ColorsRes.darkGrey,
                          ),
                          isDense: true,
                          hintText: 'Enter sheet name',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                      child: DateTimePicker(
                        type: DateTimePickerType.time,
                        controller: _controllerTime,
                        icon: Icon(Icons.access_time),
                        timeLabelText: "End Time",
                        use24HourFormat: false,
                        locale: Locale('en', 'IN'),
                        onChanged: (val) {
                          print('0' + val.toString());
                          setState(() {
                            _controllerTime.text = val;
                          });
                        },
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  width: 2.w,
                ),
                Card(
                  margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                  color: ColorsRes.mainBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.6.w)),
                  child: InkWell(
                    onTap: () async {
                      if (_controllerName.text.isNotEmpty &&
                          _controllerTime.text.isNotEmpty) {
                        var addSheet = await SheetsRepository().addSheets(
                            _controllerName.text, _controllerTime.text);
                        if (addSheet.success == true) {
                          _controllerName.text = '';
                          _controllerTime.text = '';
                          SmartDialog.showToast(
                              "${_controllerName.text} Added");
                        }
                      } else {
                        print('Bearer ${global.prefs.get('token')}');
                        SmartDialog.showToast("Please fill all data");
                      }
                      ref.refresh(sheetDataProvider);
                    },
                    child: Container(
                      height: 6.w,
                      width: 25.w,
                      alignment: Alignment.center,
                      child: Text(
                        'Add',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorsRes.white, fontSize: 2.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.w,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return _data.when(data: (dynamic data) {
                  print('agentsDataProvider 0 : ${_data.value!.data}');
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: _data.value!.data!.map((e) {
                      return sheetsList(
                          'https://cdn-icons-png.flaticon.com/256/281/281761.png',
                          e.name,
                          e.endTime,
                          context);
                    }).toList(),
                  );
                }, error: (Object error, StackTrace stackTrace) {
                  return Text('Error');
                }, loading: () {
                  return CircularProgressIndicator();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget sheetsList(
    String? pic, String? name, String? date, BuildContext context) {
  return Container(
    // width: 50.w,
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
                  date!,
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
          // Image.asset(
          //   'assets/icons/pin.png',
          //   height: 3.w,
          //   width: 3.w,
          // ),
          SizedBox(
            width: 4.w,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPanel(1, ''),
                  ));
            },
            icon: Icon(
              IconlyBroken.arrow_right,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}
