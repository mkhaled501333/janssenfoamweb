import 'package:flutter/material.dart';

class TankLevel extends StatelessWidget {
  const TankLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 300 * .62,
          width: MediaQuery.of(context).size.width * .09,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 188, 223, 251),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7))),
        ),
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width * .09,
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(7)),
          child: const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("         60 %"),
                Text("Total hight :400"),
                Text("filled   :      250"),
                Text("empyt :      150"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
