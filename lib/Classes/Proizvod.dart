class Proizvod {
  final String naziv;
  final String imageUrl;
  final String marka;
  final String opis;
  final String tipProizvoda;
  final double popust;
  final double cijena;
  final int brojProizvoda;

  Proizvod({
    this.naziv,
    this.marka,
    this.cijena,
    this.imageUrl,
    this.opis = "",
    this.popust = 0.0,
    this.brojProizvoda = 0,
    this.tipProizvoda,
  });

  Map<String, dynamic> toJSON() {
    return {
      'naziv': this.naziv,
      'marka': this.marka,
      'cijena': this.cijena,
      'imageUrl': this.imageUrl,
      'opis': this.opis,
      'popust': this.popust,
      'brojProizvoda': this.brojProizvoda,
      'tipProizvoda': this.tipProizvoda,
    };
  }

  Proizvod fromJSON(dynamic proizvodJSON) {
    return new Proizvod(
      naziv: proizvodJSON['naziv'],
      marka: proizvodJSON['marka'],
      cijena: proizvodJSON['cijena'],
      imageUrl: proizvodJSON['imageUrl'],
      opis: proizvodJSON['opis'],
      popust: proizvodJSON['popust'],
      brojProizvoda: proizvodJSON['brojProizvoda'],
      tipProizvoda: proizvodJSON['tipProizvoda'],
    );
  }
}
