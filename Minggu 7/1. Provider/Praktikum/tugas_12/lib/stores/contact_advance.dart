import 'package:flutter/material.dart';
import 'package:tugas_12/models/contact_model.dart';

class ContactAdvanceStore with ChangeNotifier {
  final List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  // Add Form
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final _name = TextEditingController();
  TextEditingController get name => _name;

  final _phone = TextEditingController();
  TextEditingController get phone => _phone;

  DateTime date = DateTime.now();

  Color color = Colors.purple;

  String fileName = "";

  //  Update Form
  final _formKeyUpdate = GlobalKey<FormState>();
  GlobalKey get formKeyUpdate => _formKeyUpdate;

  final _nameUpdate = TextEditingController();
  TextEditingController get nameUpdate => _nameUpdate;

  final _phoneUpdate = TextEditingController();
  TextEditingController get phoneUpdate => _phoneUpdate;

  DateTime dateUpdate = DateTime.now();

  Color colorUpdate = Colors.purple;

  String fileNameUpdate = "";

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
