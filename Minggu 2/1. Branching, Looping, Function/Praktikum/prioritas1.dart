void main() {
  // No2
  for (var i = 1; i <= 10; i++) {
    print(i);
  }

  // No1
  // int nilai = 50;
  // print(cekNilai(nilai));
}

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}
