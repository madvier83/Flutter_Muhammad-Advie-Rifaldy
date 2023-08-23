void main() {
  // No2
  var data = [
    "js",
    "js",
    "js",
    "golang",
    "python",
    "js",
    "js",
    "golang",
    "rust"
  ];

  Map<String, int> frekuensi = {};

  for (var i in data) {
    int prev = frekuensi[i] ?? 0;
    frekuensi[i] = prev + 1;
  }

  print(frekuensi);

  // No1
  // var data = [
  //   "amuse",
  //   "tommy kaira",
  //   "spoon",
  //   "HKS",
  //   "litchfield",
  //   "amuse",
  //   "HKS"
  // ];

  // for (var i = 0; i < data.length; i++) {
  //   for (var j = i + 1; j < data.length; j++) {
  //     if (data[i] == data[j]) {
  //       data.removeAt(j);
  //     }
  //   }
  // }

  // print(data);
}
