import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_12/screens/contact/header.dart';
import 'package:tugas_12/components/contact_list.dart';
import 'package:tugas_12/components/date_picker.dart';
import 'package:tugas_12/components/drawer_global.dart';
import 'package:tugas_12/components/file_picker.dart';
import 'package:tugas_12/components/text_field_global.dart';
import 'package:tugas_12/components/color_picker.dart';
import 'package:tugas_12/models/contact_model.dart';
import 'package:tugas_12/models/validator.dart';
import 'package:tugas_12/stores/contact_advance.dart';

class ContactAdvanceProvider extends StatefulWidget {
  const ContactAdvanceProvider({super.key});

  @override
  State<ContactAdvanceProvider> createState() => _ContactAdvanceProviderState();
}

class _ContactAdvanceProviderState extends State<ContactAdvanceProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Provider"),
        centerTitle: true,
      ),
      drawer: const DrawerGlobal(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              const ContactHeader(),
              buildAddForm(),
              const Text(
                "List Contacts",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),
              buildContactList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddForm() {
    final contactProvider = Provider.of<ContactAdvanceStore>(context);
    return Form(
      key: contactProvider.formKey,
      child: Column(
        children: [
          TextFieldGlobal(
            label: "Name",
            controller: contactProvider.name,
            validator: (value) {
              if (Validator().validateName(value) != null) {
                return Validator().validateName(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFieldGlobal(
            label: "Phone",
            controller: contactProvider.phone,
            validator: (value) {
              if (Validator().validatePhone(value) != null) {
                return Validator().validatePhone(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DatePicker1(
            date: contactProvider.date,
            onChange: (DateTime value) {
              setState(
                () {
                  contactProvider.date = value;
                },
              );
            },
          ),
          ColorPicker1(
            color: contactProvider.color,
            onChange: (Color color) {
              setState(
                () {
                  contactProvider.color = color;
                },
              );
            },
          ),
          FilePicker1(
            value: contactProvider.fileName,
            onChange: (value) {
              setState(
                () {
                  contactProvider.fileName = value;
                },
              );
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () {
                  if(!contactProvider.formKey.currentState!.validate()) return;
                  contactProvider.addContact(
                    Contact(
                      title: contactProvider.name.text,
                      subtitle: contactProvider.phone.text,
                      color: contactProvider.color,
                      date: contactProvider.date,
                      file: contactProvider.fileName,
                    ),
                  );

                  contactProvider.name.text = "";
                  contactProvider.phone.text = "";
                  contactProvider.color = Colors.purple;
                  contactProvider.date = DateTime.now();
                  contactProvider.fileName = "";
                },
                child: const Text("Submit"),
              )
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget buildUpdateForm(int index, StateSetter setState) {
    final contactProvider =
        Provider.of<ContactAdvanceStore>(context, listen: false);
    return Form(
      key: contactProvider.formKeyUpdate,
      child: Column(
        children: [
          TextFieldGlobal(
            label: "Name",
            controller: contactProvider.nameUpdate,
            validator: (value) {
              if (Validator().validateName(value) != null) {
                return Validator().validateName(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFieldGlobal(
            label: "Phone",
            controller: contactProvider.phoneUpdate,
            validator: (value) {
              if (Validator().validatePhone(value) != null) {
                return Validator().validatePhone(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DatePicker1(
            date: contactProvider.dateUpdate,
            onChange: (DateTime value) {
              setState(
                () {
                  contactProvider.dateUpdate = value;
                },
              );
            },
          ),
          ColorPicker1(
            color: contactProvider.colorUpdate,
            onChange: (Color color) {
              setState(
                () {
                  contactProvider.colorUpdate = color;
                },
              );
            },
          ),
          FilePicker1(
            value: contactProvider.fileNameUpdate,
            onChange: (value) {
              setState(
                () {
                  contactProvider.fileNameUpdate = value;
                },
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void onUpdate(index) async {
    final contactProvider =
        Provider.of<ContactAdvanceStore>(context, listen: false);
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Contact"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: buildUpdateForm(index, setState),
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                contactProvider.updateContact(
                  index,
                  Contact(
                    title: contactProvider.nameUpdate.text,
                    subtitle: contactProvider.phoneUpdate.text,
                    date: contactProvider.dateUpdate,
                    color: contactProvider.colorUpdate,
                    file: contactProvider.fileNameUpdate,
                  ),
                );
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Widget buildContactList() {
    final contactProvider = Provider.of<ContactAdvanceStore>(context);
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: contactProvider.contacts.length,
      itemBuilder: (context, index) {
        var data = contactProvider.contacts[index];
        return ContactListTile(
          data: data,
          onUpdate: () {
            contactProvider.nameUpdate.text = contactProvider.contacts[index].title;
            contactProvider.phoneUpdate.text = contactProvider.contacts[index].subtitle;
            contactProvider.dateUpdate = contactProvider.contacts[index].date;
            contactProvider.colorUpdate = contactProvider.contacts[index].color;
            contactProvider.fileNameUpdate = contactProvider.contacts[index].file;
            onUpdate(index);
          },
          onDelete: () {
            contactProvider.deleteContact(index);
          },
        );
      },
    );
  }
}
