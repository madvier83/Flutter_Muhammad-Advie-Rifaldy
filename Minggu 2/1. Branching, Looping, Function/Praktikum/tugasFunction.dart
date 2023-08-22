void main() {
  // no2
  printFaktorial(10);
  printFaktorial(40);
  printFaktorial(50);

  // no1
  // double r = 10;
  // print(hitungLuasLingkaran(r));
}

void printFaktorial(int nilai) {
  BigInt hasil = new BigInt.from(1);
  for (var i = nilai; i > 1; i--) {
    hasil = hasil * new BigInt.from(i);
  }
  print("Faktorial dari $nilai = $hasil");
  print("");
}

// double hitungLuasLingkaran(double r) {
//   return 3.14 * r * r;
// }
