// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_function_type_syntax_for_parameters, empty_catches, camel_case_types

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/models/moderls.dart';
import 'package:janssenfoamweb/foam/utiles/enums.dart';
import 'package:janssenfoamweb/foam/utiles/extentions.dart';

class final_prodcut_controller extends ChangeNotifier {
  Map<String, FinalProductModel> all = {};
  Map<String, FinalProductModel> finalproducts = {};
  Map<String, FinalProductModel> Archived_finalproducts = {};
  getData() {
    finals_From_firebase();
  }

  finals_From_firebase() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("finalprodcuts");
    ref.get().then((onValue) {
      if (onValue.value != null) {
        for (var e in onValue.children) {
          final record = FinalProductModel.fromJson(e.value.toString());
          if (record.actions.if_action_exist(
                  finalProdcutAction.archive_final_prodcut.getactionTitle) ==
              false) {
            finalproducts.addAll({record.finalProdcut_ID.toString(): record});
          } else {
            finalproducts.remove(record.finalProdcut_ID.toString());
            Archived_finalproducts.addAll(
                {record.finalProdcut_ID.toString(): record});
          }
        }
        print("get finalprodcuts data");
        Refresh_Ui();
      }
    });
    ref.onChildChanged.listen((onData) {
      if (onData.snapshot.value != null) {
        final record =
            FinalProductModel.fromJson(onData.snapshot.value.toString());
        if (record.actions.if_action_exist(
                finalProdcutAction.archive_final_prodcut.getactionTitle) ==
            false) {
          finalproducts.addAll({record.finalProdcut_ID.toString(): record});
        } else {}
        print("get blocks data");
        Refresh_Ui();
      }
    });
  }

  Refresh_Ui() {
    notifyListeners();
  }

  String searchin_OutOFStock = "";
  DateTime from = DateTime.now();
  DateTime to = DateTime.now();
  List<String> selctedcolors = [];
  List<String> selctedtybes = [];
  List<String> selctedDensities = [];
  List<String> selctedsizes = [];
  List<String> selctedcustomers = [];
  String? selectedreport;
  DateTime? pickedDateFrom;
  DateTime? pickedDateTo;
  List<DateTime> AllDatesOfOfData() {
    List<DateTime> a = finalproducts.values
        .where((e) => e.actions.if_action_exist(
            finalProdcutAction.incert_finalProduct_from_Others.getactionTitle))
        .map((e) => e.actions.get_Date_of_action(
            finalProdcutAction.incert_finalProduct_from_Others.getactionTitle))
        .toList();
    List<DateTime> b = finalproducts.values
        .where((e) => e.actions.if_action_exist(finalProdcutAction
            .incert_finalProduct_from_cutingUnit.getactionTitle))
        .map((e) => e.actions.get_Date_of_action(finalProdcutAction
            .incert_finalProduct_from_cutingUnit.getactionTitle))
        .toList();
    var v = a + b;
    return v.isEmpty ? [DateTime.now()] : v;
  }

  int indexOfRadioButon = 0;
}
