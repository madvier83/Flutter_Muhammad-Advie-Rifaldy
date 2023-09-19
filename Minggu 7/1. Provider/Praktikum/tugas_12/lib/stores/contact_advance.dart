import 'package:flutter/material.dart';
import 'package:tugas_12/models/contact_model.dart';

class ContactAdvanceStore with ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index, Contact contact) {
    _contacts[index] = contact;
    notifyListeners();
  }
}