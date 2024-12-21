import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/widgits/cars/biscol.dart';
import 'package:janssenfoamweb/foam/utiles/enums.dart';
import 'package:janssenfoamweb/foam/utiles/extentions.dart';

import 'package:provider/provider.dart';

const backgrond = Color.fromARGB(255, 3, 21, 37);
const cartHeader = Color.fromARGB(255, 22, 44, 70);
const cartbody = Color.fromARGB(255, 33, 65, 99);
const textTittle = Color.fromARGB(255, 124, 172, 248);
const text = Color.fromARGB(255, 211, 227, 253);
const text1 = Color.fromARGB(255, 120, 138, 162);
const text2 = Color.fromARGB(255, 61, 77, 94);
const text3 = Color.fromARGB(255, 216, 90, 143);
const buttonbackground = Color.fromARGB(255, 8, 66, 160);
const notificationBackgroundbackground = Color.fromARGB(255, 23, 33, 34);
const notificationText = Color.fromARGB(255, 248, 170, 3);

class CartsStatistics extends StatelessWidget {
  const CartsStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .3,
      height: 500,
      decoration: const BoxDecoration(
          color: backgrond,
          borderRadius: BorderRadius.all(Radius.circular(11))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<Carscontroller>(
          builder: (context, myType, child) {
            final daycars = myType.allrecords.values.where(
              (element) =>
                  element.actions.if_action_exist(
                          WhigtTecketAction.archive_tecket.getTitle) ==
                      false &&
                  element.actions
                          .get_Date_of_action(
                              WhigtTecketAction.create_newTicket.getTitle)
                          .formatt_yMd() ==
                      DateTime.now().formatt_yMd(),
            );

            final underword = daycars.where((element) =>
                element.firstShot != 0.0 && element.secondShot == 0.0);
            final done = daycars.where((element) =>
                element.firstShot != 0.0 && element.secondShot != 0.0);
            return Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .138,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: cartHeader),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "قيد التحميل : (${underword.length})",
                                    style: TextStyle(
                                        color: text,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .009,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 415,
                              width: double.infinity,
                              decoration: const BoxDecoration(color: cartbody),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: underword
                                      .map((e) => Text(
                                            "${e.prodcutName}>${e.driverName} ${e.carNum} ${e.customerName}",
                                            style: TextStyle(
                                                color: text1,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .009,
                                                fontWeight: FontWeight.bold),
                                          ))
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .138,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: cartHeader),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "تم التحميل : (${done.length})",
                                    style: TextStyle(
                                        color: text,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                .009,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 415,
                              width: double.infinity,
                              decoration: const BoxDecoration(color: cartbody),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: done
                                      .map((e) => Text(
                                            "${e.prodcutName}>${e.driverName} ${e.carNum} ${e.customerName}",
                                            style: TextStyle(
                                                color: text1,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .009,
                                                fontWeight: FontWeight.bold),
                                          ))
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .28,
                  decoration: const BoxDecoration(
                      color: notificationBackgroundbackground),
                  child: Center(
                    child: Text(
                      "Total : ${daycars.isEmpty ? 0 : daycars.map((e) => e.totalWeight).reduce(
                            (value, element) => value + element,
                          )} kg",
                      style: TextStyle(
                          color: notificationText,
                          fontSize: MediaQuery.of(context).size.width * .01,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
