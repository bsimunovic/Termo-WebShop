import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';

class OnamaTab extends StatelessWidget {
  final Function informationFunction;

  OnamaTab({
    this.informationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          informationFunction("O nama", oNamaTextValue),
        ],
      ),
    );
  }
}
