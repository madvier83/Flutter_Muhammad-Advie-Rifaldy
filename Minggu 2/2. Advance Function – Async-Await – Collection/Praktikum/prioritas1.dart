void main() async {
  List<int> data = [1, 2, 3, 40, 50];
  data = await kaliList(data, 5);
  print(data);
}

Future<List<int>> kaliList(List<int> data, int pengali) {
  List<int> hasil = [];
  for (var i in data) {
    hasil.add(i * pengali);
  }
  return Future.delayed(Duration(seconds: 3), () {
    return hasil;
  });
}
