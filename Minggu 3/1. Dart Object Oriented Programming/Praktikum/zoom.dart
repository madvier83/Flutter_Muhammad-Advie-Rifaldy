class Persegi {
  static int panjang = 1;
  static int lebar = 1;

  int keliling() {
    return (panjang + lebar) * 2;
  }
}

void main() {
  Persegi lapangan = Persegi();
  Persegi lapangan2 = Persegi();

  // lapangan.panjang = 15;
  // lapangan.lebar = 35;

  Persegi.panjang = 15;
  Persegi.lebar = 35;

  print(lapangan.keliling());
  print(lapangan2.keliling());
}
