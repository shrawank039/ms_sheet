import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_sheet/repositories/agents_repository.dart';
import 'package:ms_sheet/repositories/assistant_repository.dart';
import 'package:ms_sheet/repositories/counters_repository.dart';
import 'package:ms_sheet/repositories/local_player_repository.dart';
import 'package:ms_sheet/repositories/panel_repository.dart';
import 'package:ms_sheet/repositories/sheets_repository.dart';
import 'package:sizer/sizer.dart';

import '../providers/data_providers.dart';
import '../ui/styles/color.dart';

class DeleteConfirmationPopup extends ConsumerWidget {
  final int id;
  final String type;
  final ExtraDataParameter extraDataParameter;

  const DeleteConfirmationPopup(this.id, this.type, this.extraDataParameter,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ExtraDataParameter extraData = extraDataParameter;
    return Dialog(
      clipBehavior: Clip.none,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(2.5.w),
            width: 60.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Are You Sure?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 9.0.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        'After deleting you cannot undo this.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 7.0.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.9.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: (() async {
                            var delete;
                            if (type == 'agent') {
                              delete =
                                  await AgentsRepository().deleteAgents(id);
                              if (delete.success == true) {
                                Navigator.of(context).pop();
                                ref.refresh(agentsDataProvider);
                              }
                            } else if (type == 'counter') {
                              delete =
                                  await CountersRepository().deleteCounters(id);
                              if (delete.success == true) {
                                Navigator.of(context).pop();
                                ref.refresh(counterDataProvider);
                              }
                            } else if (type == 'sheet') {
                              delete =
                                  await SheetsRepository().deleteSheets(id);
                              if (delete.success == true) {
                                Navigator.of(context).pop();
                                ref.refresh(sheetDataProvider);
                              }
                            } else if (type == 'assistant') {
                              delete =
                                  await AssistantRepository().deleteAssistant(id);
                              if (delete.success == true) {
                                Navigator.of(context).pop();
                                ref.refresh(assistantDataProvider);
                              }
                            }
                            else if (type == 'local_player') {
                              delete = await LocalPlayersRepository()
                                  .deleteLocalPlayers(id);
                              if (delete.success == true) {
                                Navigator.of(context).pop();
                                ref.refresh(localPlayerDataProvider);
                              }
                            } else if (type == 'panel') {
                              delete = await PanelRepository().deletePanel(id);
                              if (delete.success == true) {
                                Navigator.of(context).pop();
                                ref.refresh(panelDataProvider(extraData));
                              }
                            }
                          }),
                          child: Card(
                            margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                            color: ColorsRes.red,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.6.w)),
                            child: Container(
                              height: 6.w,
                              width: 25.w,
                              alignment: Alignment.center,
                              child: Text(
                                'Yes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsRes.white, fontSize: 2.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: (() => Navigator.of(context).pop()),
                          child: Card(
                            margin: EdgeInsets.only(right: 1.w, top: 1.5.w),
                            color: ColorsRes.mainBlue,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.6.w)),
                            child: Container(
                              height: 6.w,
                              width: 25.w,
                              alignment: Alignment.center,
                              child: Text(
                                'No',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsRes.white, fontSize: 2.w),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
