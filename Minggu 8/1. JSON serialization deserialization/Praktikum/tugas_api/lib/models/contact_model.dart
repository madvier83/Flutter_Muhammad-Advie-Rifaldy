import 'dart:convert';

class ContactModel {
  int? id;
  String name;
  String phone;

  ContactModel({
    this.id,
    required this.name,
    required this.phone,
  });
}
