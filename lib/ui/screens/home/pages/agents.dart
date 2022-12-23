import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:ms_sheet/repositories/agents_repository.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/delete_confirmation_popup.dart';
import 'package:sizer/sizer.dart';

import '../../../../models/agents_response_entity.dart';

class Agents extends ConsumerStatefulWidget {
  @override
  ConsumerState<Agents> createState() => _SheetsState();
}

class _SheetsState extends ConsumerState<Agents> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(agentsDataProvider);
    print('agentsDataProvider : ${_data.value?.message}');
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Mobile = Small (smaller than 640px)
        // Tablet = Medium (641px to 1007px)
        // Laptop = Large (1008px and larger)
        if (constraints.maxWidth < 640) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 4.w,
                ),
                CreateAgentSectionMobile(),
                SizedBox(
                  height: 2.w,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return _data.when(data: (dynamic data) {
                            print(
                                'agentsDataProvider 0 : ${_data.value?.data}');
                            return Column(
                              children: _data.value!.data!.map((e) {
                                return agentsListMobile(e, context);
                              }).toList(),
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return Text('Error');
                          }, loading: () {
                            return CircularProgressIndicator();
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.w,
              ),
              CreateAgentSection(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return _data.when(data: (dynamic data) {
                            print(
                                'agentsDataProvider 0 : ${_data.value!.message}');
                            return Column(
                              children: _data.value!.data!.map((e) {
                                return agentsList(e, context);
                              }).toList(),
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return Text('Error');
                          }, loading: () {
                            return CircularProgressIndicator();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      },
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
            'Agents',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
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

Widget agentsList(AgentsResponseData data, BuildContext context) {
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
              'https://cdn-icons-png.flaticon.com/256/3135/3135715.png',
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
                  data.createdAt!,
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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => DeleteConfirmationPopup(data.id!,
                      'agent', const ExtraDataParameter(dataList: [])));
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

Widget agentsListMobile(
    AgentsResponseData agentsResponseData, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 2.w),
    decoration: DesignConfig.boxDecorationContainerCardShadow(
        ColorsRes.white, Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
      child: Row(
        children: [
          SizedBox(
            width: 0.5.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/256/4128/4128176.png',
              height: 12.w,
              width: 12.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Padding(
            padding: EdgeInsets.all(1.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  agentsResponseData.name!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 3.5.w,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(
                  height: 1.w,
                ),
                Text(
                  agentsResponseData.createdAt!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 2.8.w,
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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const DeleteConfirmationPopup(
                      0, 'agent', ExtraDataParameter(dataList: [])));
            },
            icon: Icon(
              Icons.delete,
              color: ColorsRes.red,
              size: 6.w,
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
              size: 6.w,
            ),
          ),
        ],
      ),
    ),
  );
}

class CreateAgentSection extends ConsumerStatefulWidget {
  const CreateAgentSection({super.key});

  @override
  ConsumerState<CreateAgentSection> createState() => _CreateAgentSectionState();
}

class _CreateAgentSectionState extends ConsumerState<CreateAgentSection> {
  AgentsResponseData? selectedAgents;
  final TextEditingController textEditingController = TextEditingController();
  late TextEditingController _controllerName;
  late TextEditingController _controllerMobile;
  late TextEditingController _controllerPair;
  late TextEditingController _controllerInOut;
  late TextEditingController _controllerCommission;
  late TextEditingController _controllerPatti;
  late TextEditingController _controllerReferenceComm;
  late TextEditingController _controllerIncentive;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerName = TextEditingController(text: '');
    _controllerMobile = TextEditingController(text: '');
    _controllerPair = TextEditingController(text: '');
    _controllerInOut = TextEditingController(text: '');
    _controllerCommission = TextEditingController(text: '');
    _controllerPatti = TextEditingController(text: '');
    _controllerReferenceComm = TextEditingController(text: '');
    _controllerIncentive = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(agentsDataProvider);
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 1.w),
        padding: EdgeInsets.all(1.5.w),
        decoration: DesignConfig.boxDecorationContainerCardShadow(
            ColorsRes.white,
            const Color.fromRGBO(44, 39, 46, 0.059),
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
                      'Enter client name',
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
                      'Enter mobile number',
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
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Pair rate',
                      Icons.monetization_on,
                      3.w,
                      TextInputType.number,
                      _controllerPair),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'In out rate',
                      Icons.monetization_on,
                      3.w,
                      TextInputType.number,
                      _controllerInOut),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Commission',
                      Icons.monetization_on,
                      3.w,
                      TextInputType.number,
                      _controllerCommission),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Patti',
                      Icons.pattern,
                      3.w,
                      TextInputType.number,
                      _controllerPatti),
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
                      'Reference Commission',
                      Icons.production_quantity_limits,
                      3.w,
                      TextInputType.number,
                      _controllerReferenceComm),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.w)),
                    elevation: 0,
                    color: const Color(0xFFf9f9f9),
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return _data.when(data: (dynamic data) {
                            print('DropdownButton2 0 : ${_data.value!.data}');
                            return DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFf9f9f9),
                                ),
                                isExpanded: true,
                                hint: Text(
                                  'Select Reference',
                                  style: TextStyle(
                                    fontSize: 2.2.w,
                                    color: const Color.fromARGB(
                                        255, 174, 174, 174),
                                  ),
                                ),
                                items: _data.value?.data!
                                    .map((item) =>
                                        DropdownMenuItem<AgentsResponseData>(
                                          value: item,
                                          child: Text(
                                            item.name.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedAgents,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAgents = value;
                                  });
                                },
                                //itemHeight: 40,
                                dropdownMaxHeight: 300,
                                searchController: textEditingController,
                                searchInnerWidget: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      // contentPadding: const EdgeInsets.symmetric(
                                      //   horizontal: 10,
                                      //   vertical: 8,
                                      // ),
                                      hintText: 'Search for clients...',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return Text('Error');
                          }, loading: () {
                            return CircularProgressIndicator();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.w,
            ),
            Row(
              children: [
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Daily incentive',
                      Icons.credit_card,
                      3.w,
                      TextInputType.number,
                      _controllerIncentive),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Card(
                  margin: EdgeInsets.only(right: 1.w),
                  color: ColorsRes.mainBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.6.w)),
                  child: InkWell(
                    onTap: () async {
                      if (_controllerName.text.isNotEmpty &&
                          _controllerMobile.text.isNotEmpty &&
                          _controllerPair.text.isNotEmpty &&
                          _controllerInOut.text.isNotEmpty &&
                          _controllerCommission.text.isNotEmpty &&
                          _controllerPatti.text.isNotEmpty &&
                          _controllerReferenceComm.text.isNotEmpty &&
                          _controllerIncentive.text.isNotEmpty &&
                          selectedAgents!.name!.isNotEmpty) {
                        var addAgent = await AgentsRepository().addAgent(
                            _controllerName.text,
                            _controllerMobile.text,
                            _controllerPair.text,
                            _controllerInOut.text,
                            _controllerCommission.text,
                            _controllerPatti.text,
                            selectedAgents!.id!,
                            _controllerReferenceComm.text,
                            _controllerIncentive.text);
                        if (addAgent.success == true) {
                          _controllerName.clear();
                          _controllerMobile.clear();
                          _controllerPair.clear();
                          _controllerInOut.clear();
                          _controllerCommission.clear();
                          _controllerPatti.clear();
                          _controllerReferenceComm.clear();
                          _controllerIncentive.clear();
                          textEditingController.clear();
                          setState(() {
                            selectedAgents = null;
                          });
                          ref.refresh(agentsDataProvider);
                          SmartDialog.showToast(
                              "${_controllerName.text} Added");
                        }
                      } else {
                        SmartDialog.showToast("Please fill all data");
                      }
                    },
                    child: Container(
                      height: 7.w,
                      width: 30.w,
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
            )
          ],
        ),
      ),
    );
  }
}

class CreateAgentSectionMobile extends ConsumerStatefulWidget {
  const CreateAgentSectionMobile({super.key});

  @override
  ConsumerState<CreateAgentSectionMobile> createState() =>
      _CreateAgentSectionMobileState();
}

class _CreateAgentSectionMobileState
    extends ConsumerState<CreateAgentSectionMobile> {
  AgentsResponseData? selectedAgentsM;
  final TextEditingController textEditingController = TextEditingController();
  late TextEditingController _controllerName;
  late TextEditingController _controllerMobile;
  late TextEditingController _controllerPair;
  late TextEditingController _controllerInOut;
  late TextEditingController _controllerCommission;
  late TextEditingController _controllerPatti;
  late TextEditingController _controllerReferenceComm;
  late TextEditingController _controllerIncentive;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerName = TextEditingController(text: '');
    _controllerMobile = TextEditingController(text: '');
    _controllerPair = TextEditingController(text: '');
    _controllerInOut = TextEditingController(text: '');
    _controllerCommission = TextEditingController(text: '');
    _controllerPatti = TextEditingController(text: '');
    _controllerReferenceComm = TextEditingController(text: '');
    _controllerIncentive = TextEditingController(text: '');
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(agentsDataProvider);
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: DesignConfig.boxDecorationContainerCardShadow(ColorsRes.white,
          Color.fromRGBO(44, 39, 46, 0.059), 10.0, 3, 3, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Agent name',
                    Icons.person,
                    5.w,
                    TextInputType.text,
                    _controllerName),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Mobile number',
                    Icons.mobile_friendly,
                    5.w,
                    TextInputType.phone,
                    _controllerMobile),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Pair rate',
                    Icons.monetization_on,
                    5.w,
                    TextInputType.number,
                    _controllerPair),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'In out rate',
                    Icons.monetization_on,
                    5.w,
                    TextInputType.number,
                    _controllerInOut),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Commission',
                    Icons.monetization_on,
                    5.w,
                    TextInputType.number,
                    _controllerCommission),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Patti',
                    Icons.pattern,
                    5.w,
                    TextInputType.number,
                    _controllerPatti),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Reference Commission',
                    Icons.production_quantity_limits,
                    5.w,
                    TextInputType.number,
                    _controllerReferenceComm),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Daily incentive',
                    Icons.credit_card,
                    5.w,
                    TextInputType.number,
                    _controllerIncentive),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
                  margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5.w)),
                  elevation: 0,
                  color: const Color(0xFFf9f9f9),
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        return _data.when(data: (dynamic data) {
                          print('DropdownButton2 1 : ${_data.value!.data}');
                          return DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFFf9f9f9),
                              ),
                              isExpanded: true,
                              hint: Text(
                                'Select Reference',
                                style: TextStyle(
                                  fontSize: 2.2.w,
                                  color:
                                      const Color.fromARGB(255, 174, 174, 174),
                                ),
                              ),
                              items: _data.value?.data!
                                  .map((item) =>
                                      DropdownMenuItem<AgentsResponseData>(
                                        value: item,
                                        child: Text(
                                          item.name.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedAgentsM,
                              onChanged: (value) {
                                setState(() {
                                  selectedAgentsM = value;
                                });
                              },
                              //itemHeight: 40,
                              dropdownMaxHeight: 300,
                              searchController: textEditingController,
                              searchInnerWidget: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // contentPadding: const EdgeInsets.symmetric(
                                    //   horizontal: 10,
                                    //   vertical: 8,
                                    // ),
                                    hintText: 'Search for clients...',
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                          );
                        }, error: (Object error, StackTrace stackTrace) {
                          return Text('Error');
                        }, loading: () {
                          return CircularProgressIndicator();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.only(left: 1.w, right: 1.w, top: 2.w),
                  color: ColorsRes.mainBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.5.w)),
                  child: InkWell(
                    onTap: () async {
                      if (_controllerName.text.isNotEmpty &&
                          _controllerMobile.text.isNotEmpty &&
                          _controllerPair.text.isNotEmpty &&
                          _controllerInOut.text.isNotEmpty &&
                          _controllerCommission.text.isNotEmpty &&
                          _controllerPatti.text.isNotEmpty &&
                          _controllerReferenceComm.text.isNotEmpty &&
                          _controllerIncentive.text.isNotEmpty &&
                          selectedAgentsM!.name!.isNotEmpty) {
                        var addAgent = await AgentsRepository().addAgent(
                            _controllerName.text,
                            _controllerMobile.text,
                            _controllerPair.text,
                            _controllerInOut.text,
                            _controllerCommission.text,
                            _controllerPatti.text,
                            selectedAgentsM!.id!,
                            _controllerReferenceComm.text,
                            _controllerIncentive.text);
                        if (addAgent.success == true) {
                          setState(() {
                            selectedAgentsM = null;
                          });
                          ref.refresh(agentsDataProvider);
                          _controllerName.clear();
                          _controllerMobile.clear();
                          _controllerPair.clear();
                          _controllerInOut.clear();
                          _controllerCommission.clear();
                          _controllerPatti.clear();
                          _controllerReferenceComm.clear();
                          _controllerIncentive.clear();
                          textEditingController.clear();
                          SmartDialog.showToast(
                              "${_controllerName.text} Added");
                        }
                      } else {
                        ref.refresh(agentsDataProvider);
                        SmartDialog.showToast("Please fill all data");
                      }
                    },
                    child: Container(
                      height: 11.w,
                      width: 30.w,
                      alignment: Alignment.center,
                      child: Text(
                        'Add',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorsRes.white, fontSize: 4.w),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
