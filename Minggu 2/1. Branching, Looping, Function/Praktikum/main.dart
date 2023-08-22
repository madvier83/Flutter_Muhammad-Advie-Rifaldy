// latihan pas zoom meet

void main() {
  bool isLess = compare(angka1: 12.1, angka2: 12.3);
  print("Angka ${isLess ? "pertama" : "kedua"} lebih kecil");
}

bool compare({required double angka1, required double angka2}) {
  return angka1 - angka2 < 0;
}
