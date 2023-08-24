class Calculator {
  double penjumlahan(double a, double b) {
    return a + b;
  }

  double pengurangan(double a, double b) {
    return a - b;
  }

  double perkalian(double a, double b) {
    return a * b;
  }

  double pembagian(double a, double b) {
    return a / b;
  }
}

void main() {
  var calc = Calculator();

  print(calc.penjumlahan(2, 2));
  print(calc.pengurangan(1, 2));

  print(calc.perkalian(2, 2));
  print(calc.pembagian(1, 2));
}
