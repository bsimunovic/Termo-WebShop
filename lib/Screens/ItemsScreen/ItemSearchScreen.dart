import 'package:flutter/material.dart';
import 'package:termo_vukovar/Classes/HomeMenuItems.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/Screens/HomeScreen/Widgets/NavigationBar.dart';
import 'package:termo_vukovar/Classes/Proizvod.dart';
import 'Widgets/SearchAppBar.dart';

class ItemSearchScreen extends StatefulWidget {
  final List<HomeMenuItems> items;
  final int pushedId;

  ItemSearchScreen({
    @required this.items,
    @required this.pushedId,
  });
  _ItemSearchScreen createState() => _ItemSearchScreen();
}

class _ItemSearchScreen extends State<ItemSearchScreen> {
  List<Proizvod> proizvodi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bg1Url), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            NavigationBar(),
            SearchAppBar(
              items: widget.items,
              pushedId: widget.pushedId,
            ),
          ],
        ),
      ),
    );
  }
}
