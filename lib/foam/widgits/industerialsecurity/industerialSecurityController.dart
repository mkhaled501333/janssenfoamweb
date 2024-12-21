// ignore_for_file: non_constant_identifier_names, empty_catches, file_names, unused_element

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/models/moderls.dart';

class IndusterialSecuritycontroller extends ChangeNotifier {
  Map<String, IndusterialSecurityModel> all = {};
  DateTime? pickedDateFrom;
  DateTime? pickedDateTO;
  List<String> selectedPoints = [];
  List<String> selectedPersons = [];
  List<String> selectedhous = [];
  SensorModel? sensotdata;
  List<DateTime> AllDatesOfOfData() {
    return all.values.map((d) => d.date).toList();
  }

  getdata() async {
    industerialsecurity_From_firebase();
  }

  industerialsecurity_From_firebase() {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("industerialsecurity");
    ref.get().then((onValue) {
      if (onValue.value != null) {
        for (var e in onValue.children) {
          final record = IndusterialSecurityModel.fromJson(e.value.toString());
          all.addAll({record.ID.toString(): record});
        }
        print("get orders data");
        Refresh_the_UI();
      }
    });
    ref.onChildChanged.listen((onData) {
      if (onData.snapshot.value != null) {
        final record =
            IndusterialSecurityModel.fromJson(onData.snapshot.value.toString());
        all.addAll({record.ID.toString(): record});
        print("get orders data");
        Refresh_the_UI();
      }
    });
  }

  Refresh_the_UI() {
    notifyListeners();
  }
}
