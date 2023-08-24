void main() async {
  // No3
  // var hasil = await faktorial(10);
  // print(hasil);

  // No2
  // var data = [7, 5, 3, 5, 2, 1];

  // double total = 0;
  // for (var i in data) {
  //   total += i;
  // }
  // double hasil = total / data.length;

  // print(hasil.ceil());

  // No1
  // var data = [
  //   ["bahasa", "dart"],
  //   ["framework", "flutter"],
  //   ["state", "bloc"]
  // ];

  // var stack = {};
  // for (var obj in data) {
  //   stack[obj[0]] = obj[1];
  // }

  // print(stack);
}

Future<int> faktorial(int angka) {
  int hasil = 1;
  for (angka; angka > 1; angka--) {
    hasil *= angka;
  }
  return Future.delayed(Duration(seconds: 1), () {
    return hasil;
  });
}
