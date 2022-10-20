import 'package:flutter/material.dart';
import 'package:termo_vukovar/ListePodataka/Font/FontSize.dart';
import 'package:termo_vukovar/ListePodataka/Strings.dart';

class KontaktTab extends StatelessWidget {
  Widget makeKontaktInfo(String type, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: type + ": ",
              style: TextStyle(
                fontSize: fontText,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: fontText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: screenSize.width * 0.5,
                  height: screenSize.width * 0.18,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(kontaktImageUrl),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(
                      color: Colors.black.withAlpha(150),
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withAlpha(150),
                    width: 1,
                  ),
                  color: Colors.transparent.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appTitle.toUpperCase() + " d.o.o",
                                style: TextStyle(
                                  fontSize: fontNaslov,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              makeKontaktInfo("OIB", oibValue),
                              makeKontaktInfo("Banka", bankaValue),
                              makeKontaktInfo("IBAN", ibanValue),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Poslovnica Vukovar".toUpperCase(),
                                style: TextStyle(
                                  fontSize: fontNaslov,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.75),
                                ),
                              ),
                              makeKontaktInfo("Adresa", adresaValue),
                              makeKontaktInfo("Telefon", telefonValue),
                              makeKontaktInfo("FAX", faxValue),
                              makeKontaktInfo("Email", emailValue),
                              makeKontaktInfo(
                                  "Radno Vrijeme",
                                  "\n" +
                                      radnoVrijemePonPetValue +
                                      "\n" +
                                      radnoVrijemeSubValue),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(),
        ),
      ],
    );
  }
}
