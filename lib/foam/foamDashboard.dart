import 'package:flutter/material.dart';

import 'package:janssenfoamweb/foam/widgits/blocks/blocks.dart';
import 'package:janssenfoamweb/foam/widgits/cars/cars.dart';
import 'package:janssenfoamweb/foam/widgits/industerialsecurity/industerialSecurity.dart';
import 'package:janssenfoamweb/foam/widgits/industerialsecurity/tanklevel.dart';
import 'package:janssenfoamweb/foam/widgits/orders/cuttingOrders.dart';
import 'package:janssenfoamweb/foam/widgits/roundedSissor.dart';

class FoamDashboard extends StatelessWidget {
  FoamDashboard({super.key});
  final ScrollController? controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: controller,
        interactive: true,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatisticsCuttingOrders(),
                  const CartsStatistics(),
                ],
              ),
              const Row(
                children: [
                  BlocksStaticks(),
                  RoundedSessorStatistics(),
                ],
              ),
              const Row(
                children: [
                  industerialSecurityreportwidgetStatistics(),
                  TankLevel(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
