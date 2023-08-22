import 'dart:io';

void main() {
  // Prioritas 2 No2
  int row = 10;
  for (var y = row; y > 0; y -= 2) {
    for (var x = row; x > y; x--) {
      stdout.write(" ");
    }
    for (var x = 0; x <= y; x++) {
      stdout.write("0 ");
    }
    print("");
  }
  for (var y = 0; y <= row; y += 2) {
    for (var x = row; x > y; x--) {
      stdout.write(" ");
    }
    for (var x = 0; x <= y; x++) {
      stdout.write("0 ");
    }
    print("");
  }

  // Prioritas 2 No1
  // int row = 25;
  // for (var y = 0; y < row; y += 2) {
  //   for (var x = row; x > y; x--) {
  //     stdout.write(" ");
  //   }
  //   for (var x = 0; x <= y; x++) {
  //     stdout.write("* ");
  //   }
  //   print("");
  // }
}
