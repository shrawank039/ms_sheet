import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ms_sheet/global.dart' as global;
import 'package:ms_sheet/models/assistant_response.dart';
import 'package:ms_sheet/models/sheets_response_entity.dart';
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:ms_sheet/repositories/assistant_repository.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/widgets/khata_entry_popup.dart';
import 'package:sizer/sizer.dart';
import '../../../../../repositories/auth_repository.dart';
import '../../../../../repositories/sheets_repository.dart';
import '../../../../../widgets/delete_confirmation_popup.dart';
import '../../../../styles/design.dart';
import '../../../../utils/toast.dart';

AssistantResponseData? selectedAssistant;
bool updateAssistant = false;
int selectedAssistantID = 0;

class AddAssistant extends StatefulWidget {
  const AddAssistant({super.key});

  @override
  State<AddAssistant> createState() => _AddAssistantState();
}

class _AddAssistantState extends State<AddAssistant> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: CreateAssistant(),
    );
  }
}

class CreateAssistant extends ConsumerStatefulWidget {
  const CreateAssistant({super.key});

  @override
  ConsumerState<CreateAssistant> createState() => _CreateAssistantState();
}

class _CreateAssistantState extends ConsumerState<CreateAssistant> {
  late TextEditingController _controllerName,
      _controllerMobile,
      _controllerPass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerName = TextEditingController(text: '');
    _controllerMobile = TextEditingController(text: '');
    _controllerPass = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(assistantDataProvider);

    if (selectedAssistant != null) {
      _controllerName.text = selectedAssistant!.name!;
      _controllerMobile.text = selectedAssistant!.mobileNumber!;
    }

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
                      hoverColor: Colors.transparent,
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorsRes.darkGrey,
                        size: 2.8.w,
                      )),
                  Text(
                    'Add Assistant',
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
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Enter name',
                      Icons.person,
                      3.w,
                      TextInputType.text,
                      _controllerName),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Enter mobile',
                      Icons.mobile_friendly,
                      3.w,
                      TextInputType.phone,
                      _controllerMobile),
                ),
              ],
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
                        controller: _controllerPass,
                        style: TextStyle(
                            fontSize: 2.3.w,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: ColorsRes.darkGrey,
                          ),
                          isDense: true,
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(50, 0, 0, 0)),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
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
                          _controllerMobile.text.isNotEmpty ) {
                        if(updateAssistant){
var addAssistant = await AssistantRepository().updateAssistant(
                                 selectedAssistantID,
                                _controllerName.text,
                                _controllerMobile.text,
                                );
                        if (addAssistant.success == true) {
                          _controllerName.text = '';
                          _controllerMobile.text = '';
                          _controllerPass.text = '';
                          setState(() {
                            selectedAssistant = null;
                            updateAssistant = false;
                            selectedAssistantID = 0;
                          });
                          ref.refresh(assistantDataProvider);
                          ShowToast("Updated", context);
                        }
                        }else{
var addAssistant = await AssistantRepository().addAssitant(
                                _controllerName.text,
                                _controllerMobile.text,
                                _controllerPass.text,
                                'assistant',
                                global.prefs.get('id'));
                                
                        if (addAssistant.success == true) {
                          _controllerName.text = '';
                          _controllerMobile.text = '';
                          _controllerPass.text = '';
                          setState(() {
                            selectedAssistant = null;
                            updateAssistant = false;
                            selectedAssistantID = 0;
                          });
                          ref.refresh(assistantDataProvider);
                          ShowToast("Added", context);
                        }
                        }
                      } else {
                        ShowToast("Please fill all data", context);
                      }

                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 6.w,
                      alignment: Alignment.center,
                      child: Text(
                        updateAssistant ? 'Update' : 'Add',
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
                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: _data.value!.data!.map((e) {
                        return assistentList(
                            'https://cdn-icons-png.flaticon.com/256/3135/3135715.png',
                            e,
                            context);
                      }).toList(),
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget assistentList(
    String? pic, AssistantResponseData data, BuildContext context) {
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Container(
        // width: 50.w,
        margin: EdgeInsets.only(top: 1.w),
        decoration: DesignConfig.boxDecorationContainerCardShadow(
            ColorsRes.white,
            Color.fromRGBO(44, 39, 46, 0.059),
            12.0,
            3,
            3,
            20,
            0),
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
                      data.name!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 1.7.w,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      data.mobileNumber!,
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
              Card(
                                      margin: EdgeInsets.all(1.w),
                                      color: ColorsRes.red,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.6.w)),
                                      child: InkWell(
                                        onTap: () async {
                                          showDialog(
                      context: context,
                      builder: (context) => KhataEntryPopup(data.id!));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                      
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Points: ${data.creditPoints}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ColorsRes.white,
                                                fontSize: 1.6.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.all(1.w),
                                      color: ColorsRes.grayColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.6.w)),
                                      child: InkWell(
                                        onTap: () async {
                                          
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                      
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Clients: ${data.totalClients}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ColorsRes.white,
                                                fontSize: 1.6.w),
                                          ),
                                        ),
                                      ),
                                    ),
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: 4.w,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => DeleteConfirmationPopup(data.id!,
                          'assistant', const ExtraDataParameter(dataList: [])));
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
              IconButton(
                onPressed: () {
                  selectedAssistant = data;
                  selectedAssistantID = data.id!;
                  updateAssistant = true;
                  ref.refresh(assistantDataProvider);
                },
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
    },
  );
}
