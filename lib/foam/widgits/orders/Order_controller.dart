// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_function_type_syntax_for_parameters, empty_catches

import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/models/moderls.dart';

import 'package:janssenfoamweb/foam/utiles/enums.dart';
import 'package:janssenfoamweb/foam/utiles/extentions.dart';

class OrderController extends ChangeNotifier {
  Map<String, cutingOrder> cuttingOrders = {};
  Map<String, cutingOrder> initalData = {};

  List<cutingOrder> get opendOrders => cuttingOrders.values
      .where((element) =>
          element.actions.if_action_exist(OrderAction.order_colosed.getTitle) ==
          false)
      .sortedBy<num>((element) => element.serial)
      .reversed
      .toList();
  getData() {
    cuttingOrders_From_firebase();
  }

  cuttingOrders_From_firebase() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("cuttingorders");
    ref.get().then((onValue) {
      if (onValue.value != null) {
        for (var e in onValue.children) {
          final record = cutingOrder.fromJson(e.value.toString());
          if (record.actions
                  .if_action_exist(OrderAction.Archive_order.getTitle) ==
              false) {
            cuttingOrders.addAll({record.cuttingOrder_ID.toString(): record});
          } else {
            cuttingOrders.addAll({record.cuttingOrder_ID.toString(): record});
          }
        }
        print("get orders data");
        Refrsh_ui();
      }
    });
    ref.onChildChanged.listen((onData) {
      if (onData.snapshot.value != null) {
        final record = cutingOrder.fromJson(onData.snapshot.value.toString());
        if (record.actions
                .if_action_exist(OrderAction.Archive_order.getTitle) ==
            false) {
          cuttingOrders.addAll({record.cuttingOrder_ID.toString(): record});
        } else {}
        print("get orders data");
        Refrsh_ui();
      }
    });
  }

  OperationOrederItems? item;
  cutingOrder? order;

  Refrsh_ui() {
    notifyListeners();
  }

  bool showAproves = false;
  bool showButtoms = false;
}
