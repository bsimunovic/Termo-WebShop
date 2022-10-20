import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/ListePodataka/globals.dart';
import 'package:termo_vukovar/Screens/HomeScreen/Widgets/NavigationBar.dart';

class KosaricaScreen extends StatefulWidget {
  _KosaricaScreen createState() => _KosaricaScreen();
}

class _KosaricaScreen extends State<KosaricaScreen> {
  _findSameProizvod() {
    for (int i = 0; i <= (currentCart.length / 10) + 2; i++) {
      for (int index = 0; index < currentCart.length - 1; index++) {
        for (int index2 = 0; index2 < currentCart.length; index2++) {
          if (currentCart[index].proizvod == currentCart[index2].proizvod &&
              index != index2) {
            currentCart[index].brojProizvoda +=
                currentCart[index2].brojProizvoda;
            currentCart.removeAt(index2);
          }
        }
      }
    }
  }

  double finalPrice() {
    double finalPrice = 0;
    for (int i = 0; i < currentCart.length; i++) {
      finalPrice += currentCart[i].brojProizvoda *
          (currentCart[i].proizvod.cijena +
              currentCart[i].proizvod.cijena * currentCart[i].proizvod.popust);
    }
    return finalPrice;
  }

  @override
  void initState() {
    super.initState();
    cartItems.forEach((element) {
      currentCart.add(element);
    });
    cartItems = [];
    if (currentCart.length > 1) {
      _findSameProizvod();
    }
  }

  _buildListView() {
    setState(() {});
    return ListView.builder(
      itemCount: currentCart.length,
      itemBuilder: (context, index) {
        return Card(
            child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.asset(currentCart[index].proizvod.imageUrl),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentCart[index].proizvod.naziv,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Cijena: " +
                            (currentCart[index].proizvod.cijena -
                                    currentCart[index].proizvod.cijena *
                                        (currentCart[index].proizvod.popust /
                                            100))
                                .toString() +
                            " HRK",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Količina: " +
                        currentCart[index].brojProizvoda.toString()),
                    GestureDetector(
                      onTap: () {
                        currentCart.remove(currentCart[index]);
                        setState(() {});
                      },
                      child: Icon(
                        Icons.delete_outline,
                        size: 40,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
      },
    );
  }

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
            Row(
              children: [
                Expanded(
                  child: Column(),
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.75),
                              width: 1,
                            ),
                            color: Colors.transparent.withOpacity(0.1),
                          ),
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: _buildListView(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  "Ukupna cijena: ",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                trailing: Text(
                                  finalPrice().toStringAsFixed(2) + " HRK",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(),
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
