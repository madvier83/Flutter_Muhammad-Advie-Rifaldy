class ContactModel {
  late int? id;
  late String name;
  late String phone;

  ContactModel({
    this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
    };
  }

  ContactModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    phone = map["phone"];
  }
}
