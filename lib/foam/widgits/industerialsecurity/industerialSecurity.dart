// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/widgits/industerialsecurity/industerialSecurityController.dart';
import 'package:janssenfoamweb/foam/models/moderls.dart';
import 'package:janssenfoamweb/foam/utiles/extentions.dart';
import 'package:provider/provider.dart';

class industerialSecurityreportwidgetStatistics extends StatelessWidget {
  const industerialSecurityreportwidgetStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<IndusterialSecuritycontroller>(
      builder: (context, myType, child) {
        List<IndusterialSecurityModel> all = myType.all.values
            .where((test) =>
                test.date.formatt_yMd() == DateTime.now().formatt_yMd())
            .toList();
        // .filterFinalProductDateBetween(
        //     myType.pickedDateFrom!, myType.pickedDateTO!);
        final point1 = all.where((test) => test.place == "1");
        final point2 = all.where((test) => test.place == "2");
        final point3 = all.where((test) => test.place == "3");
        final point4 = all.where((test) => test.place == "4");
        final point5 = all.where((test) => test.place == "05");
        final point6 = all.where((test) => test.place == "06");
        final point7 = all.where((test) => test.place == "07");
        final point8 = all.where((test) => test.place == "08");
        final point9 = all.where((test) => test.place == "09");
        final point10 = all.where((test) => test.place == "10");
        final point11 = all.where((test) => test.place == "11");
        final point12 = all.where((test) => test.place == "12");
        return SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pont(
                        p: point1,
                        tillte: "محطة المياه",
                      ),
                      pont(
                        p: point2,
                        tillte: "المحولات",
                      ),
                      pont(
                        p: point3,
                        tillte: "الطلمبات",
                      ),
                      pont(
                        p: point4,
                        tillte: "الكيماويات",
                      ),
                      pont(
                        p: point5,
                        tillte: "التنكات",
                      ),
                      pont(
                        p: point6,
                        tillte: "المعمل",
                      ),
                      pont(
                        p: point7,
                        tillte: "الصبه",
                      ),
                      pont(
                        p: point8,
                        tillte: "المنشر",
                      ),
                      pont(
                        p: point9,
                        tillte: "البلوكات",
                      ),
                      pont(
                        p: point10,
                        tillte: "المقصات",
                      ),
                      pont(
                        p: point11,
                        tillte: "الميزان",
                      ),
                      pont(
                        p: point12,
                        tillte: "ش خلفى",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class pont extends StatelessWidget {
  const pont({
    super.key,
    required this.p,
    required this.tillte,
  });
  final Iterable<IndusterialSecurityModel> p;
  final String tillte;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).removePadding().size.width * .065,
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                color: const Color.fromARGB(66, 151, 73, 158)),
            child: Center(
                child: Text(
              tillte,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).removePadding().size.width *
                      .0079),
            )),
          ),
          Container(
            width: MediaQuery.of(context).removePadding().size.width * .065,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Column(
              children: [
                ...p.map((e) => Text(
                      "${e.date.formatt_hm()}${e.who}",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context)
                                  .removePadding()
                                  .removePadding()
                                  .size
                                  .width *
                              .0072,
                          color: p.toList().indexOf(e) != 0 &&
                                  (e.date.formatt_num().to_int() -
                                          p
                                              .elementAt(
                                                  p.toList().indexOf(e) - 1)
                                              .date
                                              .formatt_num()
                                              .to_int() >
                                      100)
                              ? Colors.red
                              : Colors.black),
                    )),
                Container(
                    width: MediaQuery.of(context).removePadding().size.width *
                        .065,
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Center(
                        child: Text(
                      p.length.toString(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context)
                                  .removePadding()
                                  .size
                                  .width *
                              .0078,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
