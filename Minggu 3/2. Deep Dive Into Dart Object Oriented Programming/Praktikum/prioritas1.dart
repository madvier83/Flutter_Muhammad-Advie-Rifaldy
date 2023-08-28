class BangunRuang {
  double panjang = 0;
  double lebar = 0;
  double tinggi = 0;

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  double sisi = 0;

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  Balok bata = Balok();
  bata.panjang = 5;
  bata.lebar = 8;
  bata.tinggi = 2.5;
  print(bata.volume());

  Kubus bangun = Kubus();
  bangun.sisi = 5;
  print(bangun.volume());
}
