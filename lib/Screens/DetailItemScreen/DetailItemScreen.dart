import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/Screens/HomeScreen/Widgets/NavigationBar.dart';
import 'package:termo_vukovar/Classes/Proizvod.dart';

import 'Widgets/ItemBar.dart';

class DetailItemScreen extends StatefulWidget {
  final Proizvod proizvod;

  DetailItemScreen({
    this.proizvod,
  });

  _DetailItemScreen createState() => _DetailItemScreen();
}

class _DetailItemScreen extends State<DetailItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bg1Url), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            NavigationBar(),
            ItemBar(
              proizvod: widget.proizvod,
            ),
          ],
        ),
      ),
    );
  }
}
