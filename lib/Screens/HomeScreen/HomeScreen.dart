import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'Widgets/HomeMenuItemsBar.dart';
import 'Widgets/NavigationBar.dart';
import 'Widgets/NovostiBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bg1Url), fit: BoxFit.cover),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            NavigationBar(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.1)),
                      child: Column(
                        children: [
                          NovostiBar(),
                          HomeMenuItemsBar(),
                        ],
                      ),
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
