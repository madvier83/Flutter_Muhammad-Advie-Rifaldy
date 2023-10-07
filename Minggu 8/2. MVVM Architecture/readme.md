# MVVM (Model-View-ViewModel)
MVVM adalah singkatan dari "Model-View-ViewModel," yang merupakan sebuah pola arsitektur perangkat lunak yang digunakan dalam pengembangan aplikasi.

Model: Komponen ini mewakili data atau logika bisnis aplikasi.

View: Ini adalah bagian dari aplikasi yang bertanggung jawab untuk menampilkan informasi kepada pengguna dan input dari pengguna.

ViewModel: ViewModel adalah komponen perantara yang menghubungkan Model dan View. bertanggung jawab untuk mengambil data dari Model sehingga dapat ditampilkan di View.

Contoh Model
```
class ContactModel {
  int? id;
  String name;
  String phone;

  ContactModel({
    this.id,
    required this.name,
    required this.phone,
  });

  factory ContactModel.fromMap(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
```

Contoh view model
```
class ImageGeneratorViewModel extends ChangeNotifier {
  String _avatar = "";
  String get avatar => _avatar;

  final TextEditingController _seedController = TextEditingController();
  TextEditingController get seedController => _seedController;

  final api = ImageGeneratorApi();

  Future<void> getAvatar({String seed = ""}) async {
    _avatar = await api.getAvatar(seed: seed);
    notifyListeners();
  }
}
```
 MVVM menggunakan sistem binding data, yang membuat perubahan data otomatis dari Model ke View dan sebaliknya.

 MVVM memisahkan sepenuhnya logika bisnis (Model dan ViewModel) dari tampilan (View). Ini membuat kode lebih mudah diatur, dikelola, dan diuji.