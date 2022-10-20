import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/Classes/HomeMenuItems.dart';
import 'package:termo_vukovar/ListePodataka/globals.dart';
import '../../../FireBaseServices.dart';
import '../../../Classes/Proizvod.dart';
import 'dart:async';

class ExpansionPanelListMenu extends StatefulWidget {
  final List<HomeMenuItems> items;
  final pushedId;
  final Function onListChanged;

  ExpansionPanelListMenu({
    this.items,
    this.pushedId = 0,
    this.onListChanged,
  });

  _ExpansionPanelListMenu createState() => _ExpansionPanelListMenu();
}

class _ExpansionPanelListMenu extends State<ExpansionPanelListMenu> {
  List<Proizvod> filtriranaLista = [];

  Future<void> fetchDatabaseProizvodi() async {
    dynamic resultat = await FireBaseServices()
        .getFilteredProizvodiList(currentMark, currentTipProizvoda);
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

  Widget customRadioListTile(String productType, String productValue) {
    return RadioListTile(
      title: Text(productValue),
      value: productValue,
      groupValue: currentMark,
      onChanged: (String value) async {
        setState(() {
          currentMark = value;
          currentTipProizvoda = productType;
        });
        await fetchDatabaseProizvodi();
        widget.onListChanged(filtriranaLista);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      animationDuration: Duration(milliseconds: 500),
      initialOpenPanelValue: widget.pushedId,
      expansionCallback: (panelIndex, isExpanded) async {
        if (isExpanded == true) {
          setState(() {
            currentMark = null;
            currentTipProizvoda = null;
          });
          await fetchDatabaseProizvodi();
          widget.onListChanged(filtriranaLista);
        } else {
          setState(() {
            currentMark = null;
          });
        }
      },
      children: [
        ExpansionPanelRadio(
          value: widget.items[1].id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(bojlerValue.toUpperCase()));
          },
          body: Column(
            children: <RadioListTile>[
              customRadioListTile(bojlerValue, boschValue),
              customRadioListTile(bojlerValue, vaillantValue),
              customRadioListTile(bojlerValue, gorenjeValue),
            ],
          ),
        ),
        ExpansionPanelRadio(
          value: widget.items[2].id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(radijatoriValue.toUpperCase()));
          },
          body: Column(
            children: <RadioListTile>[
              customRadioListTile(radijatoriValue, boschValue),
              customRadioListTile(radijatoriValue, vaillantValue),
            ],
          ),
        ),
        ExpansionPanelRadio(
          value: widget.items[4].id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(klimaValue.toUpperCase()));
          },
          body: Column(
            children: <RadioListTile>[
              customRadioListTile(klimaValue, samsungValue),
              customRadioListTile(klimaValue, vivaxValue),
            ],
          ),
        ),
        ExpansionPanelRadio(
          value: widget.items[3].id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(pecValue.toUpperCase()));
          },
          body: Column(
            children: <RadioListTile>[
              customRadioListTile(pecValue, boschValue),
            ],
          ),
        ),
        ExpansionPanelRadio(
          value: widget.items[6].id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(dijeloviValue));
          },
          body: Column(
            children: <RadioListTile>[
              customRadioListTile(dijeloviValue, plastikaValue),
              customRadioListTile(dijeloviValue, bakarValue),
              customRadioListTile(dijeloviValue, cinkValue),
              customRadioListTile(dijeloviValue, zeljezoValue),
            ],
          ),
        ),
        ExpansionPanelRadio(
          value: widget.items[5].id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(cijeviValue));
          },
          body: Column(
            children: <RadioListTile>[
              customRadioListTile(cijeviValue, plinValue),
              customRadioListTile(cijeviValue, vodaValue),
              customRadioListTile(cijeviValue, kanalizacijaValue),
            ],
          ),
        ),
      ],
    );
  }
}
