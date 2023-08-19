void main() {
  // print("Hwllo world");
  var nilai1 = 3;
  var nilai2 = 5;
  // var temp = nilai1;
  // nilai1 = nilai2;
  // nilai2 = temp;
  // (nilai1, nilai2) => (nilai2 nilai1);
  List<int> temp = [nilai1, nilai2];
  nilai1 = temp[1];
  nilai2 = temp[0];

  print(nilai1);
  print(nilai2);

  // nilai1, nilai2 = nilai2, nilai1;
}
