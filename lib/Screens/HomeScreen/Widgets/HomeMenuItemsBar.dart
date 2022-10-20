import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/ListaHomeMenuItems.dart';
import 'package:termo_vukovar/ListePodataka/globals.dart';
import 'package:termo_vukovar/Screens/ItemsScreen/ItemSearchScreen.dart';
import '../../../Classes/HomeMenuItems.dart';

class HomeMenuItemsBar extends StatefulWidget {
  _HomeMenuItemsBar createState() => _HomeMenuItemsBar();
}

class _HomeMenuItemsBar extends State<HomeMenuItemsBar> {
  List<HomeMenuItems> _items = itemsHomeMenuItems;

  Widget _buildGridTiles(Size screenSize) {
    List<GridTile> _tiles = [];
    _items.forEach((item) {
      _tiles.add(_buildItemTiles(item, screenSize));
    });
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.96,
        shrinkWrap: true,
        children: _tiles,
      ),
    );
  }

  Widget _buildItemTiles(HomeMenuItems item, Size screenSize) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          currentMark = null;
          currentTipProizvoda = item.tipProizvoda;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemSearchScreen(
                      items: _items,
                      pushedId: item.id,
                    )),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.16,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(item.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: screenSize.width * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    currentMark = null;
    currentTipProizvoda = null;
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: 0.6 * screenSize.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          _buildGridTiles(screenSize),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
        ],
      ),
    );
  }
}
