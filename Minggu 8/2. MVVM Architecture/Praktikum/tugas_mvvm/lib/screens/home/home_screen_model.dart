import 'package:flutter/material.dart';
import 'package:tugas_api/models/api/contact_api.dart';
import 'package:tugas_api/models/api/post_api.dart';
import 'package:tugas_api/models/contact_model.dart';
import 'package:tugas_api/models/post_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<ContactModel> _contacts = [];
  List<ContactModel> get contacts => _contacts;

  bool isLoadingContact = false;
  String postResponse = "-";
  String putResponse = "-";

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  final TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;
  final TextEditingController _bodyController = TextEditingController();
  TextEditingController get bodyController => _bodyController;

  final ContactApi api = ContactApi();

  Future<void> getContacts() async {
    isLoadingContact = true;
    notifyListeners();
    _contacts = await api.getContacts();
    isLoadingContact = false;
    notifyListeners();
  }

  Future<void> createContact(ContactModel contact) async {
    final response = await api.createContact(contact: contact);
    postResponse = response;
    notifyListeners();

    nameController.clear();
    phoneController.clear();
    FocusManager.instance.primaryFocus!.unfocus();
  }

  Future<void> getContactById(String id) async {
    isLoadingContact = true;
    notifyListeners();
    _contacts = await api.getContactById(id: id);
    isLoadingContact = false;
    notifyListeners();
  }

  Future<void> updatePost({required PostModel post}) async {
    final response = await PostApi().putPost(data: post);
    putResponse = response ?? "";
    notifyListeners();
  }
}
