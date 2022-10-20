import 'package:flutter/material.dart';
import 'package:termo_vukovar/Screens/DetailItemScreen/DetailItemScreen.dart';
import 'package:termo_vukovar/FireBaseServices.dart';
import 'package:termo_vukovar/Classes/Proizvod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class NavigationSearchContainer extends StatefulWidget {
  @override
  _NavigationSearchContainer createState() => _NavigationSearchContainer();
}

class _NavigationSearchContainer extends State<NavigationSearchContainer> {
  TextEditingController editingController = TextEditingController();
  List<Proizvod> filtriranaLista = [];
  bool isActivated = false;

  Future<void> fetchDatabaseProizvodi(String currentName) async {
    dynamic resultat =
        await FireBaseServices().getProizvodiListByName(currentName);
    if (resultat == null) {
      print("Unable to retrive");
    } else {
      List tempList = [];
      tempList = resultat;
      setState(() {
        filtriranaLista.clear();
        for (int i = 0; i < tempList.length; i++) {
          filtriranaLista.add(Proizvod().fromJSON(tempList[i]));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                    border: OutlineInputBorder(gapPadding: 0),
                    hintText: 'Pretraživanje'),
              ),
              suggestionsCallback: (currentName) async {
                if (currentName.length > 0) {
                  return await FireBaseServices()
                      .getProizvodiListByName(currentName);
                }
                return null;
              },
              itemBuilder: (context, proizvod) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(proizvod['imageUrl']),
                  ),
                  title: Text(proizvod['naziv']),
                  subtitle: Text(
                      '${proizvod['cijena'] - proizvod['cijena'] * (proizvod['popust'] / 100)} \Kn'),
                );
              },
              onSuggestionSelected: (proizvod) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailItemScreen(
                      proizvod: Proizvod().fromJSON(proizvod),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              left: 240,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
