import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:termo_vukovar/ListePodataka/Font/FontSize.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';
import 'package:termo_vukovar/ListePodataka/globals.dart';
import 'package:termo_vukovar/Classes/CartItem.dart';
import 'package:termo_vukovar/Classes/Proizvod.dart';

class ItemBar extends StatefulWidget {
  final Proizvod proizvod;

  ItemBar({
    this.proizvod,
  });

  _ItemBar createState() => _ItemBar();
}

class _ItemBar extends State<ItemBar> {
  TextEditingController textEditingController =
      new TextEditingController(text: "1");

  _findSameProizvod() {
    if (cartItems.length > 1 &&
        cartItems[0].proizvod == cartItems[1].proizvod) {
      cartItems[0].brojProizvoda += cartItems[1].brojProizvoda;
      cartItems.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 80, 40, 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: screenSize.width * 0.65,
              height: screenSize.height * 0.65,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withAlpha(150),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent.withOpacity(0.1)),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        width: screenSize.width * 0.22,
                        height: screenSize.height * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          image: DecorationImage(
                            image: AssetImage((widget.proizvod.imageUrl == null)
                                ? noImageUrl
                                : widget.proizvod.imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Text(
                                widget.proizvod.naziv.toUpperCase(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: fontText,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "Marka: ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: fontTextMin,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                widget.proizvod.marka.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: fontText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "Trenutna maloprodajna cijena:\n",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: fontTextMin,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                (widget.proizvod.cijena -
                                            widget.proizvod.cijena *
                                                (widget.proizvod.popust / 100))
                                        .toString() +
                                    " HRK",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: fontText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "Broj na raspolaganju: \n",
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: fontTextMin,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                widget.proizvod.brojProizvoda.toString(),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: fontTextMin,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              height: 30,
                              child: Text(
                                "Opis: \n",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: fontTextMin,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.proizvod.opis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: screenSize.width * 0.03,
                                  height: screenSize.height * 0.04,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: TextField(
                                      controller: textEditingController,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(2),
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9]+')),
                                      ],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelStyle: TextStyle(fontSize: 20),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  cartItems.add(
                                    new CartItem(
                                      proizvod: widget.proizvod,
                                      brojProizvoda:
                                          int.parse(textEditingController.text),
                                    ),
                                  );
                                  _findSameProizvod();

                                  textEditingController.text = "1";
                                },
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  size: screenSize.height * 0.05,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(),
          ),
        ],
      ),
    );
  }
}
