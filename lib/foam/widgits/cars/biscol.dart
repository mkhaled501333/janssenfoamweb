import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/models/moderls.dart';

class Carscontroller extends ChangeNotifier {
  Map<String, WieghtTecketMOdel> allrecords = {};
  WieghtTecketMOdel? temprecord;
  String v = '';
  bool canedit1 = true;
  bool canedit2 = true;
  TextEditingController carnumcontroller = TextEditingController();
  TextEditingController drivernamecontroller = TextEditingController();
  TextEditingController customercontroller = TextEditingController();
  TextEditingController itemcontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();
  bool channelConectioninitionlized = false;
  bool getupdatesinitionlized = false;
  bool sendPendigTicketsinitionlized = false;

  getdata() {
    remoteData();
  }

  remoteData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("biscol");
    ref.get().then((onValue) {
      if (onValue.value != null) {
        for (var e in onValue.children) {
          final record = WieghtTecketMOdel.fromJson(e.value.toString());
          allrecords.addAll({record.wightTecket_ID.toString(): record});
        }
        print("get cars  data");
        notifyListeners();
      }
      ref.onChildChanged.listen((onData) {
        if (onData.snapshot.value != null) {
          final record =
              WieghtTecketMOdel.fromJson(onData.snapshot.value.toString());
          allrecords.addAll({record.wightTecket_ID.toString(): record});
        }
        print("get cars data");
        notifyListeners();
      });
      ref.onChildAdded.listen((onData) {
        if (onData.snapshot.value != null) {
          final record =
              WieghtTecketMOdel.fromJson(onData.snapshot.value.toString());
          allrecords.addAll({record.wightTecket_ID.toString(): record});
        }
        print("get cars data");
        notifyListeners();
      });
    });
  }

  Refrech_UI() {
    notifyListeners();
  }

  List<String> selectedCarNum = [];
  List<String> selectedDrivers = [];
  List<String> selectedcustomerName = [];
  List<String> selectedProdcutName = [];
  String selectedReport = '';
  DateTime? pickedDateFrom;
  DateTime? pickedDateTO;
  String archived = 'غير محزوف';

  List<DateTime> AllDatesOfOfData() {
    return allrecords.values
        .expand((e) => e.actions)
        .map((d) => d.when)
        .toList();
  }

  WieghtTecketMOdel? ini;
}
