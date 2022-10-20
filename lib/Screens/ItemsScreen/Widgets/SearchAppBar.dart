import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/Screens/DetailItemScreen/DetailItemScreen.dart';
import 'package:termo_vukovar/Classes/HomeMenuItems.dart';
import 'package:termo_vukovar/FireBaseServices.dart';
import 'package:termo_vukovar/ListePodataka/globals.dart';
import 'ExpansionPanelListMenu.dart';
import '../../../Classes/Proizvod.dart';

class SearchAppBar extends StatefulWidget {
  final List<HomeMenuItems> items;
  final int pushedId;

  SearchAppBar({
    @required this.items,
    @required this.pushedId,
  });
  _SearchAppBar createState() => _SearchAppBar();
}

class _SearchAppBar extends State<SearchAppBar> {
  List<Proizvod> listaProizvoda = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchDatabaseProizvodi();
  }

  fetchDatabaseProizvodi() async {
    dynamic resultat = await FireBaseServices()
        .getFilteredProizvodiList(currentMark, currentTipProizvoda);
    if (resultat == null) {
      print("Unable to retrive");
    } else {
      List tempList = [];
      tempList = resultat;
      setState(() {
        for (int i = 0; i < tempList.length; i++) {
          listaProizvoda.add(Proizvod().fromJSON(tempList[i]));
        }
      });
    }
  }

  _buildGridTiles(List<Proizvod> proizvodi, Size screenSize) {
    List<GridTile> _tiles = [];
    proizvodi.forEach((item) {
      _tiles.add(_buildItemTiles(item, screenSize));
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: GridView.builder(
          controller: scrollController,
          itemCount: _tiles.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, childAspectRatio: 0.95),
          itemBuilder: (BuildContext context, int index) {
            return _tiles[index];
          }),
    );
  }

  _buildItemTiles(Proizvod proizvod, Size screenSize) {
    return GridTile(
      child: GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailItemScreen(
                    proizvod: proizvod,
                  ),
                ),
              ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: screenSize.height * 0.2,
                  width: screenSize.width * 0.12,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(150),
                    border: Border.all(
                      color: Colors.black.withAlpha(150),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage((proizvod.imageUrl == null)
                          ? noImageUrl
                          : proizvod.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.05,
                  width: screenSize.width * 0.12,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black.withAlpha(150),
                      ),
                      left: BorderSide(
                        color: Colors.black.withAlpha(150),
                      ),
                      right: BorderSide(
                        color: Colors.black.withAlpha(150),
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white30,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      proizvod.naziv,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: screenSize.height * 0.03,
                  width: screenSize.width * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withAlpha(150),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white30,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      (proizvod.cijena -
                                  proizvod.cijena * (proizvod.popust / 100))
                              .toString() +
                          " HRK",
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
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        height: screenSize.height * 0.9,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10),
              child: Container(
                width: screenSize.width * 0.15,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ExpansionPanelListMenu(
                      items: widget.items,
                      pushedId: widget.pushedId,
                      onListChanged: (filtriranaLista) {
                        setState(() {
                          listaProizvoda = filtriranaLista;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 350,
              top: -20,
              child: Container(
                height: screenSize.height * 0.9,
                width: screenSize.width * 0.75,
                child: _buildGridTiles(listaProizvoda, screenSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
