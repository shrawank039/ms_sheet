import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ms_sheet/providers/data_providers.dart';
import 'package:ms_sheet/repositories/agents_repository.dart';
import 'package:ms_sheet/repositories/assistant_repository.dart';
import 'package:ms_sheet/ui/screens/home/pages/settings/add_assistant.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/delete_confirmation_popup.dart';
import 'package:sizer/sizer.dart';
import '../../../../models/agents_response_entity.dart';
import '../../../../models/assistant_response.dart';
import '../../../utils/toast.dart';

AssistantResponseData? selectedAssistant;
bool updateAgent = false;
int selectedAgentsID = 0;
List<int> assignAgents = [];

class Assistants extends ConsumerStatefulWidget {
  @override
  ConsumerState<Assistants> createState() => _SheetsState();
}

class _SheetsState extends ConsumerState<Assistants> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(agentsDataProvider);
    final _dataAssistant = ref.watch(assistantDataProvider);

    print('agentsDataProvider : ${_dataAssistant.value?.message}');

    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Mobile = Small (smaller than 640px)
          // Tablet = Medium (641px to 1007px)
          // Laptop = Large (1008px and larger)
          if (constraints.maxWidth < 640) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 4.w,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            return _dataAssistant.when(data: (dynamic data) {
                              print(
                                  'agentsDataProvider 0 : ${_dataAssistant.value?.data}');
                              return Column(
                                children: _dataAssistant.value!.data!.map((e) {
                                  return assistentList(
                                      'https://cdn-icons-png.flaticon.com/256/4128/4128176.png',
                                      e,
                                      context);
                                }).toList(),
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                  selectedAssistant != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // width: 50.w,
                              margin: EdgeInsets.only(top: 1.w),
                              decoration:
                                  DesignConfig.boxDecorationContainerCardShadow(
                                      ColorsRes.white,
                                      Color.fromRGBO(44, 39, 46, 0.059),
                                      12.0,
                                      3,
                                      3,
                                      20,
                                      0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.2.w, vertical: 1.w),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            selectedAssistant!.name!,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 1.7.w,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          Text(
                                            selectedAssistant!.mobileNumber!,
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
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ref.refresh(agentsDataProvider);
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
                            ),
                            Expanded(
                              child: Consumer(
                                builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) {
                                  return _dataAssistant.when(data:
                                      (dynamic data) {
                                    print(
                                        'agentsDataProvider 0 : ${_dataAssistant.value?.data}');
                                    return Column(
                                      children:
                                          selectedAssistant!.clients!.map((e) {
                                        return agentsListMobile(e, context);
                                      }).toList(),
                                    );
                                  }, error:
                                      (Object error, StackTrace stackTrace) {
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
                            ),
                          ],
                        )
                      : Container(),
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
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          return _dataAssistant.when(data: (dynamic data) {
                            debugPrint(
                                'agentsDataProvider 0 : ${_dataAssistant.value!.message}');
                            return Expanded(
                              child: ListView(
                                children: _dataAssistant.value!.data!.map((e) {
                                  return assistentList(
                                      'https://cdn-icons-png.flaticon.com/256/4128/4128176.png',
                                      e,
                                      context);
                                }).toList(),
                              ),
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return const Text('Error');
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
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: selectedAssistant != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 1.w),
                              decoration:
                                  DesignConfig.boxDecorationContainerCardShadow(
                                      ColorsRes.white,
                                      Color.fromRGBO(44, 39, 46, 0.059),
                                      12.0,
                                      3,
                                      3,
                                      20,
                                      0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.2.w, vertical: 1.w),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            selectedAssistant!.name!,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 1.7.w,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromARGB(
                                                    255, 0, 0, 0)),
                                          ),
                                          Text(
                                            selectedAssistant!.mobileNumber!,
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
                                      color: ColorsRes.orangeColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.6.w)),
                                      child: InkWell(
                                        onTap: () async {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Points: ${selectedAssistant!.creditPoints}',
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
                                        onTap: () async {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Clients: ${selectedAssistant!.totalClients}',
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
                                    Card(
                                      margin: EdgeInsets.all(1.5.w),
                                      color: updateAgent ?ColorsRes.red:ColorsRes.mainBlue,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.6.w)),
                                      child: InkWell(
                                        onTap: () async {
                                          if (updateAgent) {
                                            var assign =
                                                await AssistantRepository()
                                                    .assignAgents(
                                                        selectedAssistant!.id!,
                                                        assignAgents);
                                            if (assign.success == true) {
                                              updateAgent = false;
                                            }
                                          } else {
                                            updateAgent = true;
                                          }
                                          ref.refresh(assistantDataProvider);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 5.w,
                                          alignment: Alignment.center,
                                          child: Text(
                                            updateAgent ? 'Update' : 'Edit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ColorsRes.white,
                                                fontSize: 2.w),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            updateAgent
                                ? Consumer(
                                    builder: (BuildContext context,
                                        WidgetRef ref, Widget? child) {
                                      return _dataAssistant.when(
                                          data: (dynamic data) {
                                        debugPrint(
                                            'agentsDataProvider 0 : ${_dataAssistant.value!.message}');
                                        return Expanded(
                                          child: ListView(
                                            children:
                                                _data.value!.data!.map((e) {
                                              return agentsList(e, context);
                                            }).toList(),
                                          ),
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
                                  )
                                : Consumer(
                                    builder: (BuildContext context,
                                        WidgetRef ref, Widget? child) {
                                      return _dataAssistant.when(
                                          data: (dynamic data) {
                                        debugPrint(
                                            'agentsDataProvider 0 : ${_dataAssistant.value!.message}');
                                        return Expanded(
                                          child: ListView(
                                            children: selectedAssistant!
                                                .clients!
                                                .map((e) {
                                              return agentsList(e, context);
                                            }).toList(),
                                          ),
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
                          ],
                        )
                      : Container(),
                ),
              ],
            );
          }
        },
      ),
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

Widget assistentList(
    String? pic, AssistantResponseData data, BuildContext context) {
  
  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {

      if (selectedAgentsID == data.id && !updateAgent) {
    selectedAssistant = data;
    assignAgents.clear();
    for (int i = 0; i < selectedAssistant!.clients!.length; i++) {
      assignAgents.add(selectedAssistant!.clients![i].id!);
    }
    debugPrint('selectedAssistant is matched');
  }
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
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: 4.w,
              ),
              InkWell(
                onTap: () {
                  selectedAssistant = data;
                  selectedAgentsID = data.id!;
                  assignAgents.clear();
                  updateAgent = false;
                  for (int i = 0; i < selectedAssistant!.clients!.length; i++) {
                    assignAgents.add(selectedAssistant!.clients![i].id!);
                  }
                  ref.refresh(assistantDataProvider);
                },
                child: Icon(
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

Widget agentsList(dynamic data, BuildContext context) {
  return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
    return Container(
      margin: EdgeInsets.only(top: 1.w),
      decoration: DesignConfig.boxDecorationContainerCardShadow(ColorsRes.white,
          Color.fromRGBO(44, 39, 46, 0.059), 12.0, 3, 3, 20, 0),
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
            SizedBox(
              width: 1.w,
            ),
            updateAgent
                ? Checkbox(
                    value: assignAgents.contains(data.id),
                    onChanged: (value) {
                      if (value == true) {
                        assignAgents.add(data.id!);
                      } else {
                        assignAgents.remove(data.id!);
                      }
                      debugPrint('assignAgents : $assignAgents');
                      ref.refresh(assistantDataProvider);
                    },
                  )
                : Container(),
          ],
        ),
      ),
    );
  });
}

Widget agentsListMobile(Clients agentsResponseData, BuildContext context) {
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
