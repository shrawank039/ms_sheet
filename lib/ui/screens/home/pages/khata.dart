import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:ms_sheet/models/wallet_balance_entity.dart';
import 'package:ms_sheet/models/wallet_transactions_entity.dart';
import 'package:ms_sheet/repositories/wallet_repo.dart';
import 'package:ms_sheet/ui/styles/color.dart';
import 'package:ms_sheet/ui/styles/design.dart';
import 'package:sizer/sizer.dart';

import '../../../../models/wallet_client_entity.dart';
import '../../../../providers/data_providers.dart';

final controller = PageController(
  initialPage: 0,
);
WalletClientData? selectedClient;
var agentID;

class Wallet extends ConsumerStatefulWidget {
  @override
  ConsumerState<Wallet> createState() => _SheetsState();
}

class _SheetsState extends ConsumerState<Wallet> {
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(walletClinetsDataProvider);
    final walletBal = ref.watch(walletBalDataProvider);
    ExtraDataParameter extraDataParameter =
        ExtraDataParameter(dataList: [agentID]);
    final clientTransProvider =
        ref.watch(clientTranDataProvider(extraDataParameter));

    return Expanded(
      child: PageView(
        controller: controller,
        children: [
          Column(
            children: [
              topBar(),
              SizedBox(
                height: 3.w,
              ),
              body(context, _data, walletBal)
            ],
          ),
          Column(
            children: [
              topBarTran(),
              SizedBox(
                height: 3.w,
              ),
              bodyTran(context, clientTransProvider)
            ],
          ),
        ],
      ),
    );
  }
}

// Widgets -----------------------------------------------------------------------------------------------------------------------------------------------------------------
Widget body(BuildContext context, AsyncValue<WalletClientEntity> _data,
    AsyncValue<WalletBalanceEntity> walletBal) {
  bool mobile = MediaQuery.of(context).size.width < 640;
  return mobile == true
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 1.w),
                  padding: EdgeInsets.only(top: 4.w, bottom: 2.w),
                  decoration: DesignConfig.boxDecorationContainerCardShadow(
                      ColorsRes.white,
                      const Color.fromRGBO(44, 39, 46, 0.059),
                      16.0,
                      3,
                      3,
                      20,
                      0),
                  child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return walletBal.when(data: (dynamic data) {
                        print(
                            'agentsDataProvider 0 : ${walletBal.value?.data}');
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        '₹${walletBal.value?.data?.inAmount}',
                                        style: TextStyle(
                                            color: ColorsRes.mainBlue,
                                            fontFamily: 'Spartan',
                                            fontSize: 3.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Text(
                                        'In Amount',
                                        style: TextStyle(
                                          color: Color(0xFF979FC6),
                                          fontSize: 2.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 5.w,
                                  width: 1,
                                  color: ColorsRes.greyLightColor,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        '₹${walletBal.value?.data?.outAmount}',
                                        style: TextStyle(
                                            color: ColorsRes.green,
                                            fontFamily: 'Spartan',
                                            fontSize: 3.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Text(
                                        'Out Amount',
                                        style: TextStyle(
                                          color: Color(0xFF979FC6),
                                          fontSize: 2.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.2.w),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.2.w)),
                                      color: Color(0xFFf9f9f9),
                                      elevation: 0,
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.w),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'View Reports',
                                          style: TextStyle(
                                              color: ColorsRes.mainBlue),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }, error: (Object error, StackTrace stackTrace) {
                        return Text('Error');
                      }, loading: () {
                        return CircularProgressIndicator();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                /*Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          showDialog(
                              context: context,
                              builder: (context) => KhataEntryPopup());
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.6.w, vertical: 1.5.w),
                          decoration:
                              DesignConfig.boxDecorationContainerCardShadow(
                                  ColorsRes.white,
                                  Color.fromRGBO(44, 39, 46, 0.059),
                                  16,
                                  3,
                                  3,
                                  20,
                                  0),
                          child: Row(
                            children: [
                              Card(
                                color: ColorsRes.mainBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.6.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.w),
                                  child: Text(
                                    '₹',
                                    style: TextStyle(
                                        fontSize: 2.5.w,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1.3.w,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.5.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Create New Entry',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 1.9.w,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    Text(
                                      'Daily Entry',
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
                              Expanded(child: Container()),
                              Card(
                                color: ColorsRes.lightBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.w),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 2.5.w,
                                        color: ColorsRes.mainBlue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )*/
              ],
            ),
            SizedBox(
              width: 3.w,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return _data.when(data: (dynamic data) {
                  print('agentsDataProvider 0 : ${_data.value?.data}');
                  return Column(
                    children: _data.value!.data!.map((e) {
                      return transactionList(e, context, ref);
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
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 1.w),
                      padding: EdgeInsets.only(top: 4.w, bottom: 2.w),
                      decoration: DesignConfig.boxDecorationContainerCardShadow(
                          ColorsRes.white,
                          const Color.fromRGBO(44, 39, 46, 0.059),
                          16.0,
                          3,
                          3,
                          20,
                          0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '₹${walletBal.value?.data?.inAmount}',
                                      style: TextStyle(
                                          color: ColorsRes.mainBlue,
                                          fontFamily: 'Spartan',
                                          fontSize: 3.w,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    Text(
                                      'In Amount',
                                      style: TextStyle(
                                        color: Color(0xFF979FC6),
                                        fontSize: 2.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 5.w,
                                width: 1,
                                color: ColorsRes.greyLightColor,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '₹${walletBal.value?.data?.outAmount}',
                                      style: TextStyle(
                                          color: ColorsRes.green,
                                          fontFamily: 'Spartan',
                                          fontSize: 3.w,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 1.w,
                                    ),
                                    Text(
                                      'Out Amount',
                                      style: TextStyle(
                                        color: Color(0xFF979FC6),
                                        fontSize: 2.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.w,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.2.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.2.w)),
                                    color: Color(0xFFf9f9f9),
                                    elevation: 0,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.w),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'View Reports',
                                        style: TextStyle(
                                            color: ColorsRes.mainBlue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 3.w,
                  ),
                  /*Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (() {
                            showDialog(
                                context: context,
                                builder: (context) => KhataEntryPopup());
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.6.w, vertical: 1.5.w),
                            decoration:
                                DesignConfig.boxDecorationContainerCardShadow(
                                    ColorsRes.white,
                                    Color.fromRGBO(44, 39, 46, 0.059),
                                    16,
                                    3,
                                    3,
                                    20,
                                    0),
                            child: Row(
                              children: [
                                Card(
                                  color: ColorsRes.mainBlue,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.6.w),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.w),
                                    child: Text(
                                      '₹',
                                      style: TextStyle(
                                          fontSize: 2.5.w,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 1.3.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0.5.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Create New Entry',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 1.9.w,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      Text(
                                        'Daily Entry',
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
                                Expanded(child: Container()),
                                Card(
                                  color: ColorsRes.lightBlue,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.w),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 1.w),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 2.5.w,
                                          color: ColorsRes.mainBlue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )*/
                ],
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              flex: 3,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return _data.when(data: (dynamic data) {
                    print(
                        'walletsClientsDataProvider 0 : ${_data.value?.data}');
                    return Column(
                      children: _data.value!.data!.map((e) {
                        return transactionList(e, context, ref);
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
        );
}

Widget bodyTran(BuildContext context,
    AsyncValue<WalletTransactionsEntity> clientTransProvider) {
  TextEditingController controllerAmt = TextEditingController(text: '');
  TextEditingController controllerDetails = TextEditingController(text: '');
  bool mobile = MediaQuery.of(context).size.width < 640;
  return mobile == true
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 1.w),
                  padding: EdgeInsets.only(top: 4.w, bottom: 2.w),
                  decoration: DesignConfig.boxDecorationContainerCardShadow(
                      ColorsRes.white,
                      const Color.fromRGBO(44, 39, 46, 0.059),
                      16.0,
                      3,
                      3,
                      20,
                      0),
                  child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return clientTransProvider.when(data: (dynamic data) {
                        print(
                            'clientTransProvider m : ${clientTransProvider.value?.data}');
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: userDetails(),
                                ),
                                Container(
                                  height: 5.w,
                                  width: 1,
                                  color: ColorsRes.greyLightColor,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        '₹${clientTransProvider.value?.data?.balance}',
                                        style: TextStyle(
                                            color: ColorsRes.green,
                                            fontFamily: 'Spartan',
                                            fontSize: 3.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      Text(
                                        'Payable Amount',
                                        style: TextStyle(
                                          color: Color(0xFF979FC6),
                                          fontSize: 2.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 2.2.w),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.2.w)),
                                      color: Color(0xFFf9f9f9),
                                      elevation: 0,
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.w),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'View Reports',
                                          style: TextStyle(
                                              color: ColorsRes.mainBlue),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }, error: (Object error, StackTrace stackTrace) {
                        return Text('Error');
                      }, loading: () {
                        return CircularProgressIndicator();
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 3.w,
                ),
                /* Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          showDialog(
                              context: context,
                              builder: (context) => KhataEntryPopup());
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.6.w, vertical: 1.5.w),
                          decoration:
                              DesignConfig.boxDecorationContainerCardShadow(
                                  ColorsRes.white,
                                  Color.fromRGBO(44, 39, 46, 0.059),
                                  16,
                                  3,
                                  3,
                                  20,
                                  0),
                          child: Row(
                            children: [
                              Card(
                                color: ColorsRes.mainBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.6.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.w),
                                  child: Text(
                                    '₹',
                                    style: TextStyle(
                                        fontSize: 2.5.w,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1.3.w,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.5.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Create New Entry',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 1.9.w,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    Text(
                                      'Daily Entry',
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
                              Expanded(child: Container()),
                              Card(
                                color: ColorsRes.lightBlue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.w),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 2.5.w,
                                        color: ColorsRes.mainBlue),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )*/
              ],
            ),
            SizedBox(
              width: 3.w,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return clientTransProvider.when(data: (dynamic data) {
                  print(
                      'clientTransProvider list : ${clientTransProvider.value?.data}');
                  return Column(
                    children:
                        clientTransProvider.value!.data!.transactions!.map((e) {
                      return clientTransactionList(e, context);
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
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return clientTransProvider.when(data: (dynamic data) {
                    print(
                        'clientTransProvider pc : ${clientTransProvider.value?.data}');
                    return Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 1.w),
                            padding: EdgeInsets.only(top: 4.w, bottom: 2.w),
                            decoration:
                                DesignConfig.boxDecorationContainerCardShadow(
                                    ColorsRes.white,
                                    const Color.fromRGBO(44, 39, 46, 0.059),
                                    16.0,
                                    3,
                                    3,
                                    20,
                                    0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: userDetails(),
                                    ),
                                    Container(
                                      height: 5.w,
                                      width: 1,
                                      color: ColorsRes.greyLightColor,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            '₹${clientTransProvider.value?.data?.balance}',
                                            style: TextStyle(
                                                color: ColorsRes.green,
                                                fontFamily: 'Spartan',
                                                fontSize: 2.5.w,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 1.w,
                                          ),
                                          Text(
                                            'Payable Amount',
                                            style: TextStyle(
                                              color: Color(0xFF979FC6),
                                              fontSize: 1.7.w,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.w,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.2.w),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1.2.w)),
                                          color: Color(0xFFf9f9f9),
                                          elevation: 0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.w),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'View Reports',
                                              style: TextStyle(
                                                  color: ColorsRes.mainBlue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 3.w,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  // height: 9.w,
                                  child: Card(
                                    margin: EdgeInsets.only(top: 2.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.5.w)),
                                    elevation: 0,
                                    color: ColorsRes.lightWeightColor,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: TextField(
                                        controller: controllerAmt,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 2.5.w,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w500),
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.currency_rupee,
                                            color: ColorsRes.darkGrey,
                                          ),
                                          isDense: true,
                                          hintText: '00',
                                          labelText: 'Amount',
                                          hintStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(50, 0, 0, 0)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  // height: 9.w,
                                  child: Card(
                                    margin: EdgeInsets.only(top: 2.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.5.w)),
                                    elevation: 0,
                                    color: ColorsRes.lightWeightColor,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: TextField(
                                        controller: controllerDetails,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 2.5.w,
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w500),
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.info,
                                            color: ColorsRes.darkGrey,
                                          ),
                                          isDense: true,
                                          hintText: 'Optional',
                                          labelText: 'Details',
                                          hintStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(50, 0, 0, 0)),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 1.w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      var addTransaction = await WalletRepo()
                                          .addTransaction(
                                              agentID,
                                              'pay',
                                              controllerAmt.text,
                                              controllerDetails.text);
                                      if (addTransaction.success == true) {
                                        ExtraDataParameter extraDataParameter =
                                            ExtraDataParameter(
                                                dataList: [agentID]);
                                        ref.refresh(clientTranDataProvider(
                                            extraDataParameter));
                                        ref.refresh(walletClinetsDataProvider);
                                      }
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          right: 1.w, top: 1.5.w),
                                      color: ColorsRes.red,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.6.w)),
                                      child: Container(
                                        height: 6.w,
                                        width: 25.w,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Pay',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColorsRes.white,
                                              fontSize: 2.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      var addTransaction = await WalletRepo()
                                          .addTransaction(
                                              agentID,
                                              'receive',
                                              controllerAmt.text,
                                              controllerDetails.text);
                                      if (addTransaction.success == true) {
                                        ExtraDataParameter extraDataParameter =
                                            ExtraDataParameter(
                                                dataList: [agentID]);
                                        ref.refresh(clientTranDataProvider(
                                            extraDataParameter));
                                        ref.refresh(walletClinetsDataProvider);
                                      }
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          right: 1.w, top: 1.5.w),
                                      color: ColorsRes.green,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1.6.w)),
                                      child: Container(
                                        height: 6.w,
                                        width: 25.w,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Receive',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColorsRes.white,
                                              fontSize: 2.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }, error: (Object error, StackTrace stackTrace) {
                    return Text('Error');
                  }, loading: () {
                    return CircularProgressIndicator();
                  });
                },
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              flex: 3,
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return clientTransProvider.when(data: (dynamic data) {
                    print(
                        'clientTransProvider pc list : ${clientTransProvider.value!.data}');
                    return Column(
                      children: clientTransProvider.value!.data!.transactions!
                          .map((e) {
                        return clientTransactionList(e, context);
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
        );
}

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
            'Your Khata',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
          ),
          Text(
            'Wallet section',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 1.4.w,
              color: Color.fromARGB(255, 155, 155, 155),
            ),
          )
        ],
      ),
      Expanded(child: Container()),
    ],
  );
}

Widget topBarTran() {
  return Row(
    children: [
      IconButton(
          onPressed: () {
            controller.jumpToPage(0);
          },
          hoverColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            color: ColorsRes.darkGrey,
            size: 2.8.w,
          )),
      SizedBox(
        width: 1.5.w,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Transactions',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 2.6.w),
          ),
          Text(
            'Wallet section',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 1.4.w,
              color: Color.fromARGB(255, 155, 155, 155),
            ),
          )
        ],
      ),
      Expanded(child: Container()),
    ],
  );
}

Widget userDetails() {
  return Row(
    children: [
      SizedBox(
        width: 2.5.w,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(2.2.w),
        child: Image.network(
          'https://cdn-icons-png.flaticon.com/256/149/149071.png',
          height: 5.w,
          width: 5.w,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${selectedClient?.name}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 1.7.w,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget transactionList(
    WalletClientData walletClient, BuildContext context, WidgetRef ref) {
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
              'https://cdn-icons-png.flaticon.com/256/4128/4128176.png',
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
                  walletClient.name!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 1.7.w,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  walletClient.createdAt!,
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
          Padding(
            padding: EdgeInsets.all(0.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₹${walletClient.balance}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 2.w,
                      fontWeight: FontWeight.w600,
                      color:  walletClient.balance!.contains('-')?Colors.red:ColorsRes.green),
                ),
                Text(
                  'Credited',
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
          SizedBox(
            width: 3.w,
          ),
          IconButton(
            onPressed: () {
              agentID = walletClient.agentId!;
              ExtraDataParameter extraDataParameter =
                  ExtraDataParameter(dataList: [walletClient.agentId]);
              ref.refresh(clientTranDataProvider(extraDataParameter));
              ref.refresh(walletClinetsDataProvider);
              selectedClient = walletClient;
              controller.jumpToPage(1);
            },
            icon: Icon(
              IconlyBold.arrow_right_circle,
              color: ColorsRes.mainBlue,
              size: 3.w,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget clientTransactionList(
    WalletTransactionsDataTransactions walletTransactionsData,
    BuildContext context) {
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
                  walletTransactionsData.title!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 1.7.w,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                  walletTransactionsData.createdAt!,
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
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                walletTransactionsData.description!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 1.1.w,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₹${walletTransactionsData.amount}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 2.w,
                      fontWeight: FontWeight.w600,
                      color: (walletTransactionsData.amount)!.contains('-')
                          ? ColorsRes.red
                          : ColorsRes.green),
                ),
                Text(
                  'Credited',
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
          SizedBox(
            width: 1.w,
          ),
        ],
      ),
    ),
  );
}
