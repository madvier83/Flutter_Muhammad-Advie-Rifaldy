class Hewan {
  var berat = 0;
}

class Mobil {
  var kapasitas;
  List<Hewan> muatan = [];

  int totalMuatan() {
    int total = 0;
    for (var hewan in muatan) {
      total += hewan.berat;
    }
    return total;
  }

  void tambahMuatan(Hewan hewan) {
    if (totalMuatan() + hewan.berat > kapasitas) {
      print("Hewan gagal ditambahkan! (kapasitas penuh)");
    } else {
      muatan.add(hewan);
      print("Hewan berhasil ditambahkan");
    }
  }
}

void main() {
  var sapi = Hewan();
  sapi.berat = 3;
  var kambing = Hewan();
  kambing.berat = 2;
  var ayam = Hewan();
  ayam.berat = 1;

  var pickup = Mobil();
  pickup.kapasitas = 5;
  pickup.tambahMuatan(sapi);
  pickup.tambahMuatan(ayam);
  pickup.tambahMuatan(kambing);
}
