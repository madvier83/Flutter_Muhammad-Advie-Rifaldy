import 'dart:io';

void main() {
// Cek faktor bilangan

  print("Masukan angka : ");
  String? input = stdin.readLineSync() ?? "0";
  int angka = int.parse(input);
  print("Hasil:");

  for (int i = 1; i < angka; i++) {
    if (angka % i == 0) {
      print(i);
    }
  }

// Cek kata palindrom
  // print("Masukan kata : ");

  // bool palindrom = true;
  // String? kata = stdin.readLineSync() ?? "";
  // String kataCek = kata.replaceAll(" ", "").toLowerCase();

  // for (int i = 0; i < kataCek.length; i++) {
  //   if (kataCek[i] != kataCek[kataCek.length - 1 - i]) {
  //     palindrom = false;
  //   }
  // }

  // print(
  //   "${palindrom ? "$kata adalah kata palindrom" : "$kata bukan kata palindrom"}",
  // );

// Volume tabung
  // double r = 10;
  // double l = 15;

  // double volume = 3.14 * r * r * l;

  // print("Volume tabung = $volume");

// Sambungkan 3 string
  // String firstName = "Advie";
  // String lastName = "Rifaldy";
  // String address = "Bandung";

  // print("$firstName $lastName dari $address");

// Keliling dan luas lingkaran
  // double r = 10;

  // double luas = 3.14 * r * r;
  // double keliling = 2 * 3.14 * r;

  // print("Luas lingkaran = $luas");
  // print("Keliling lingkaran = $keliling");

// Keliling dan luas persegi panjang
  // int panjang = 10;
  // int lebar = 5;

  // int luas = panjang * lebar;
  // int keliling = 2 * (panjang + lebar);

  // print("Luas persegi = $luas");
  // print("Keliling persegi = $keliling");
}
