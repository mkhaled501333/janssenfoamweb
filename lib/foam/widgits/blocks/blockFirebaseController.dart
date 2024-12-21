// ignore_for_file: non_constant_identifier_names, empty_catches, file_names, unused_element

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/models/moderls.dart';
import 'package:janssenfoamweb/foam/utiles/enums.dart';
import 'package:janssenfoamweb/foam/utiles/extentions.dart';

class BlockFirebasecontroller extends ChangeNotifier {
  Map<String, BlockModel> all = {};

  Map<String, BlockModel> blocks = {};
  Map<String, BlockModel> archived_blocks = {};
  getData() {
    blocks_From_firebase();
  }

  blocks_From_firebase() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("blocks");
    ref.get().then((onValue) {
      if (onValue.value != null) {
        for (var e in onValue.children) {
          final record = BlockModel.fromJson(e.value.toString());
          if (record.actions
                  .if_action_exist(BlockAction.archive_block.getactionTitle) ==
              false) {
            blocks.addAll({record.Block_Id.toString(): record});
          } else {
            blocks.addAll({record.Block_Id.toString(): record});
          }
        }
        print("get blocks data");
        Refresh_the_UI();
      }
      //   ref.onChildChanged.listen((onData) {
      //     if (onData.snapshot.value != null) {
      //       for (var e in onData.snapshot.children) {
      //         final record = BlockModel.fromJson(e.value.toString());
      //         if (record.actions.if_action_exist(
      //                 BlockAction.archive_block.getactionTitle) ==
      //             false) {
      //           blocks.addAll({record.Block_Id.toString(): record});
      //         } else {
      //           blocks.addAll({record.Block_Id.toString(): record});
      //         }
      //       }
      //       print("get blocks data");
      //       Refresh_the_UI();
      //     }
      //   });
      // ref.onChildAdded.listen((onData) {
      //   if (onData.snapshot.value != null) {
      //     for (var e in onData.snapshot.children) {
      //       final record = BlockModel.fromJson(e.value.toString());
      //       if (record.actions.if_action_exist(
      //               BlockAction.archive_block.getactionTitle) ==
      //           false) {
      //         blocks.addAll({record.Block_Id.toString(): record});
      //       } else {
      //         blocks.addAll({record.Block_Id.toString(): record});
      //       }
      //     }
      //     print("get blocks data");
      //     Refresh_the_UI();
      //   }
      // });
    });
  }

  Refresh_the_UI() {
    notifyListeners();
  }

  String searchinconsumed = "";
  String searchin_H = "";
  String searchin_blockstock = "";
  int amountofView = 5;
  int amountofViewForMinVeiwIn_H = 5;
  bool veiwCuttedAndimpatyNotfinals = false;

//zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz

  int initialDateRange2 = DateTime.now().formatToInt();

  List<BlockModel> filterblocksBalanceBetweenTowDates2() {
    List<BlockModel> f = blocks.values
        .toList()
        .where((element) =>
            element.actions
                .get_Date_of_action(BlockAction.create_block.getactionTitle)
                .formatToInt() <=
            initialDateRange2)
        .toList();
    f.removeWhere((element) =>
        element.actions
                .if_action_exist(BlockAction.consume_block.getactionTitle) ==
            true &&
        element.actions
                .get_Date_of_action(BlockAction.consume_block.getactionTitle)
                .formatToInt() <=
            initialDateRange2);
    return f;
  }

//zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
  String? selectedReport;
  String? selectedtype;
  String? selectedcolor;
  double? selectedDensity;
}
