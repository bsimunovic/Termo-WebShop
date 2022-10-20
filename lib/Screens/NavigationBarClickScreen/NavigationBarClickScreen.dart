import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Font/FontSize.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/Screens/HomeScreen/Widgets/NavigationBar.dart';
import 'Widgets/Kontakt.dart';
import 'Widgets/Onama.dart';
import 'Widgets/StoRadimo.dart';

class NavigationBarClickScreen extends StatelessWidget {
  final int typeNumber;
  NavigationBarClickScreen({
    @required this.typeNumber,
  });

  Widget informationWidget(String title, String description) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withAlpha(150),
          width: 1,
        ),
        color: Colors.transparent.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
            child: Text(
              title.toUpperCase(),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: fontNaslov,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
            child: Text(
              description,
              style: TextStyle(
                fontSize: fontTextMin,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkPressedItem() {
    if (typeNumber == 0) {
      return OnamaTab(informationFunction: informationWidget);
    } else if (typeNumber == 1) {
      return StoRadimoTab(informationFunction: informationWidget);
    } else {
      return KontaktTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bg1Url), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            NavigationBar(),
            checkPressedItem(),
          ],
        ),
      ),
    );
  }
}
