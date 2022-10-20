import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:termo_vukovar/Classes/Proizvod.dart';

class FireBaseServices {
  final collectionReference = FirebaseFirestore.instance.collection('Proizvod');

  addData(Proizvod proizvod) {
    Map<String, dynamic> data = {
      "naziv": proizvod.naziv,
      "marka": proizvod.marka,
      "imageUrl": proizvod.imageUrl,
      "opis": proizvod.opis,
      "tipProizvoda": proizvod.tipProizvoda,
      "cijena": proizvod.cijena,
      "popust": proizvod.popust,
      "brojProizvoda": proizvod.brojProizvoda,
    };
    collectionReference.add(data);
  }

  Future getFilteredProizvodiList(
      String filterMarka, String filterTipProizvoda) async {
    List listaProizvoda = [];
    try {
      await collectionReference
          .where('tipProizvoda', isEqualTo: filterTipProizvoda)
          .where('marka', isEqualTo: filterMarka)
          .get()
          .then((quarySnapshot) {
        quarySnapshot.docs.forEach((proizvod) {
          listaProizvoda.add(proizvod.data());
        });
      });
      return listaProizvoda;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getProizvodiListByName(String filterIme) async {
    List listaProizvoda = [];
    filterIme = filterIme.toLowerCase();
    try {
      await collectionReference
          .where('search', isGreaterThanOrEqualTo: filterIme)
          .where('search', isLessThanOrEqualTo: filterIme + '\uf8ff')
          .get()
          .then((quarySnapshot) {
        quarySnapshot.docs.forEach((proizvod) {
          listaProizvoda.add(proizvod.data());
        });
      });
      return listaProizvoda;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
