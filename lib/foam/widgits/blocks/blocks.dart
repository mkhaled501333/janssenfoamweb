import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:janssenfoamweb/foam/widgits/blocks/blockExtentions.dart';
import 'package:janssenfoamweb/foam/widgits/blocks/blockFirebaseController.dart';
import 'package:janssenfoamweb/foam/utiles/enums.dart';
import 'package:janssenfoamweb/foam/utiles/extentions.dart';
import 'package:provider/provider.dart';

class BlocksStaticks extends StatelessWidget {
  const BlocksStaticks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BlockFirebasecontroller>(
      builder: (context, myType, child) {
        final blocks = myType.blocks.values.where((e) =>
            e.actions
                .get_Date_of_action(BlockAction.consume_block.getactionTitle)
                .formatt_yMd() ==
            DateTime.now().formatt_yMd());
        final denseties = blocks.toList().filter_density();
        final x = denseties.map(
          (e) => datamodel(
              blocks.toList().filter_basedOn_density(e.item.density).length,
              e.item.density,
              (blocks.toList().filter_basedOn_density(e.item.density).length /
                      blocks.length) *
                  100),
        );
        print(blocks.length);
        print(denseties.length);
        print(x.length);
        return Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 24, 28, 58),
              borderRadius: BorderRadius.circular(9)),
          width: 500,
          child: Column(
            children: [
              const Text("البلوكات",
                  style: TextStyle(color: Color.fromARGB(96, 179, 180, 180))),
              Row(
                children: [
                  Column(
                    children: [
                      Text("(${blocks.length}) الصرف",
                          style: const TextStyle(
                              color: Color.fromARGB(96, 179, 180, 180))),
                      Container(
                        decoration: const BoxDecoration(),
                        width: 250,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: x
                                .sortedBy<num>((e) => e.count)
                                .reversed
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Row(
                                        children: [
                                          Text(
                                            " D ${e.density} ",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          Container(
                                            height: 18,
                                            width: 250 * (e.percetn / 100),
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 240, 104, 19),
                                            ),
                                            child: Visibility(
                                                visible: e.percetn >= 0.20,
                                                child: Center(
                                                  child: Text(
                                                      "${e.percetn.toStringAsFixed(1)}%",
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255))),
                                                )),
                                          ),
                                          Text(
                                            " ${e.count}",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(" الاضافه",
                          style: TextStyle(
                              color: Color.fromARGB(96, 179, 180, 180))),
                      Container(
                        decoration: const BoxDecoration(),
                        width: 250,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: []
                                .sortedBy<num>((e) => e.count)
                                .reversed
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Row(
                                        children: [
                                          Text(
                                            " D ${e.density} ",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                          Container(
                                            height: 18,
                                            width: 0,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 240, 104, 19),
                                            ),
                                            child: Visibility(
                                                visible: e.percetn >= 0.20,
                                                child: Center(
                                                  child: Text(
                                                      "${e.percetn.toStringAsFixed(1)}%",
                                                      style: const TextStyle(
                                                          fontSize: 9,
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255))),
                                                )),
                                          ),
                                          Text(
                                            " ${e.count}",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class datamodel {
  double density;
  int count;
  double percetn;
  datamodel(this.count, this.density, this.percetn);
}
