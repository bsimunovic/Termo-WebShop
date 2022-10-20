import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';

class StoRadimoTab extends StatelessWidget {
  final Function informationFunction;

  StoRadimoTab({
    this.informationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          informationFunction(strucniServisiValue, strucniServisiTextValue),
          SizedBox(
            height: 20,
          ),
          informationFunction(ovlasteniServisiValue, ovlasteniServisiTextValue),
        ],
      ),
    );
  }
}
