import 'package:flutter/material.dart';
import 'package:flutter_storage/helper/database_helper.dart';
import 'package:flutter_storage/models/contact_model.dart';

class DbManager extends ChangeNotifier {
  List<ContactModel> _contactModel = [];

  late DatabaseHelper _dbHelper;

  List<ContactModel> get contactModel => _contactModel;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllTasks();
  }

  void _getAllTasks() async {
    _contactModel = await _dbHelper.getContacts();
    notifyListeners();
  }

  Future<void> addTask(ContactModel contact) async {
    await _dbHelper.insertContact(contact);
    _getAllTasks();
  }

  Future<ContactModel> getContactById(int id) async {
    return _dbHelper.getContactById(id);
  }

  Future<void> updateContact(ContactModel contact) async {
    await _dbHelper.updateContact(contact);
    _getAllTasks();
  }

  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllTasks();
  }
}
