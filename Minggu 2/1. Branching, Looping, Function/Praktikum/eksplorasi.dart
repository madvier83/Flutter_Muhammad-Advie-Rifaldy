import 'dart:io';

void main() {
  // No2
  String nilai = stdin.readLineSync() ?? "0";

  for (var i = 1; i <= int.parse(nilai); i++) {
    var j = 1;
    while (j <= int.parse(nilai)) {
      stdout.write("${i * j} ");
      j++;
    }
    print("");
  }
  // No1
  // String nilai = stdin.readLineSync() ?? "0";
  // print(
  //     "${isPrime(int.parse(nilai)) ? "bilangan prima" : "bukan bilangan prima"}");
}

bool isPrime(int nilai) {
  for (var i = 2; i < nilai; i++) {
    if (nilai % i == 0) {
      return false;
    }
  }
  return true;
}
