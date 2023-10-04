import 'dart:convert';
import 'package:tugas_api/models/contact_model.dart';

class ContactHelper {
  ContactModel toMap({required String json}) {
    var data = jsonDecode(json);
    return ContactModel(
      id: data["id"],
      name: data["name"],
      phone: data["phone"],
    );
  }
}
