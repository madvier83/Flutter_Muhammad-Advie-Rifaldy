class Buku {
  var id;
  var judul;
  var penerbit;
  var harga;
  var kategori;
}

class TokoBuku {
  List<Buku> lib = [];

  void addBuku(Buku buku) {
    lib.add(buku);
  }

  void deleteBuku(Buku buku) {
    for (var i = 0; i < lib.length; i++) {
      if (buku == lib[i]) {
        lib.removeAt(i);
      }
    }
  }

  void showAllBuku() {
    lib.forEach((element) {
      print(element.judul);
      print("-");
    });
  }
}

void main() {
  var kamus = Buku();
  kamus.id = 001;
  kamus.judul = "Kamus lengkap bahasa inggris";
  kamus.penerbit = "Bintang Media";
  kamus.harga = 50000;
  kamus.kategori = "Bahasa";

  var manga = Buku();
  manga.id = 002;
  manga.judul = "ジョジョの奇妙な冒険";
  manga.penerbit = "Shueisha";
  manga.harga = 69000;
  manga.kategori = "Hiburan";

  var BukuKu = TokoBuku();
  print("-- Tambah 2 buku --");
  BukuKu.addBuku(kamus);
  BukuKu.addBuku(manga);
  BukuKu.showAllBuku();

  print("-- Hapus 1 buku --");
  BukuKu.deleteBuku(manga);
  BukuKu.showAllBuku();
}
