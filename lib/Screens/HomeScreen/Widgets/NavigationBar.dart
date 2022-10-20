import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Font/FontSize.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/Screens/HomeScreen/HomeScreen.dart';
import 'package:termo_vukovar/Screens/NavigationBarClickScreen/NavigationBarClickScreen.dart';
import 'package:termo_vukovar/Screens/NavigationBarClickScreen/KosaricaScreen.dart';
import 'NavigationClickItem.dart';
import 'NavigationSearchContainer.dart';

class NavigationBar extends StatelessWidget {
  void makeRoutePage({BuildContext context, Widget pageRef}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => pageRef),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.06,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Colors.transparent.withOpacity(0.1),
            Colors.transparent,
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      makeRoutePage(context: context, pageRef: HomeScreen());
                    },
                    child: Container(
                        height: 100,
                        width: 400,
                        child: Center(
                            child: Text(appTitle.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: fontNaslov,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 4,
                                ))))),
              ],
            ),
          ),
          Flexible(
            flex: 6,
            fit: FlexFit.loose,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [NavigationSearchContainer()],
                ),
                NavigationClickItem(
                  title: "O nama",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavigationBarClickScreen(typeNumber: 0),
                    ),
                  ),
                ),
                NavigationClickItem(
                  title: "Što radimo",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavigationBarClickScreen(typeNumber: 1),
                    ),
                  ),
                ),
                NavigationClickItem(
                  title: "Kontakt",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavigationBarClickScreen(typeNumber: 2),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KosaricaScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
