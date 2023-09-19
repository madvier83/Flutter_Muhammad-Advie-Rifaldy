import 'package:flutter/material.dart';
import 'package:tugas_12/models/contact_model.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];

  List<GetContact> get contacts => _contacts;

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}