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
