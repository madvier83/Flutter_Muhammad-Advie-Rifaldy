void main() {
  var nama = ["raka", "rai", "fajar", "arba", "febi", "rika"];

  var namaBaru = [];
  nama.forEach((element) {
    if (element != "raka" && element != "rai") {
      namaBaru.add(element);
    }
  });

  namaBaru.add("eri");
  print(namaBaru);
}
