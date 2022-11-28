import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:ms_sheet/widgets/delete_confirmation_popup.dart';
import 'package:sizer/sizer.dart';

import '../../../../global.dart';

class Agents extends StatefulWidget {
  @override
  State<Agents> createState() => _SheetsState();
}

class _SheetsState extends State<Agents> {
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        children: agents.map((e) {
                          return agentsListMobile(e.picture, e.name, e.date);
                        }).toList(),
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
                      child: Column(
                        children: agents.map((e) {
                          return agentsList(e.picture, e.name, e.date, context);
                        }).toList(),
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

Widget agentsList(
    String? pic, String? name, String? date, BuildContext context) {
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
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const DeleteConfirmationPopup());
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

Widget agentsListMobile(String? pic, String? name, String? date) {
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
              pic!,
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
                  name!,
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
                  date!,
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
            onPressed: () {},
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

class CreateAgentSection extends StatefulWidget {
  const CreateAgentSection({super.key});

  @override
  State<CreateAgentSection> createState() => _CreateAgentSectionState();
}

class _CreateAgentSectionState extends State<CreateAgentSection> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      TextInputType.text),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Enter mobile number',
                      Icons.mobile_friendly,
                      3.w,
                      TextInputType.phone),
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
                      TextInputType.number),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'In out rate',
                      Icons.monetization_on,
                      3.w,
                      TextInputType.number),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Commission',
                      Icons.monetization_on,
                      3.w,
                      TextInputType.number),
                ),
                Expanded(
                  child: DesignConfig.inputBoxDecorated(
                      const Color(0xFFf9f9f9),
                      1.5.w,
                      2.2.w,
                      'Patti',
                      Icons.pattern,
                      3.w,
                      TextInputType.number),
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
                      'Bid limit',
                      Icons.production_quantity_limits,
                      3.w,
                      TextInputType.number),
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
                      child: DropdownButtonHideUnderline(
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
                              color: const Color.fromARGB(255, 174, 174, 174),
                            ),
                          ),
                          items: agents
                              .map((item) => DropdownMenuItem<String>(
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
                                hintText: 'Search for agents...',
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
                      TextInputType.number),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CreateAgentSectionMobile extends StatefulWidget {
  const CreateAgentSectionMobile({super.key});

  @override
  State<CreateAgentSectionMobile> createState() =>
      _CreateAgentSectionMobileState();
}

class _CreateAgentSectionMobileState extends State<CreateAgentSectionMobile> {
  @override
  Widget build(BuildContext context) {
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
                    TextInputType.text),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Mobile number',
                    Icons.mobile_friendly,
                    5.w,
                    TextInputType.phone),
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
                    TextInputType.number),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'In out rate',
                    Icons.monetization_on,
                    5.w,
                    TextInputType.number),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Commission',
                    Icons.monetization_on,
                    5.w,
                    TextInputType.number),
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
                    TextInputType.number),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Bid limit',
                    Icons.production_quantity_limits,
                    5.w,
                    TextInputType.number),
              ),
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Daily incentive',
                    Icons.credit_card,
                    5.w,
                    TextInputType.number),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: DesignConfig.inputBoxDecorated(
                    const Color(0xFFf9f9f9),
                    1.5.w,
                    4.w,
                    'Reference',
                    Icons.person_add,
                    5.w,
                    TextInputType.text),
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
            ],
          )
        ],
      ),
    );
  }
}
