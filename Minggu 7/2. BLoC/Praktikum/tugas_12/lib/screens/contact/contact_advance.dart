import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_12/bloc/contact/contact_bloc.dart';
import 'package:tugas_12/bloc/contact/contact_event.dart';
import 'package:tugas_12/bloc/contact/contact_state.dart';
import 'package:tugas_12/screens/contact/header.dart';
import 'package:tugas_12/components/contact_list.dart';
import 'package:tugas_12/components/date_picker.dart';
import 'package:tugas_12/components/drawer_global.dart';
import 'package:tugas_12/components/file_picker.dart';
import 'package:tugas_12/components/text_field_global.dart';
import 'package:tugas_12/components/color_picker.dart';
import 'package:tugas_12/models/contact_model.dart';
import 'package:tugas_12/models/validator.dart';

class ContactAdvanceBloc extends StatefulWidget {
  const ContactAdvanceBloc({super.key});

  @override
  State<ContactAdvanceBloc> createState() => _ContactAdvanceBlocState();
}

class _ContactAdvanceBlocState extends State<ContactAdvanceBloc> {
  var formKey = GlobalKey<FormState>();
  var formKeyUpdate = GlobalKey<FormState>();

  var name = TextEditingController();
  var phone = TextEditingController();
  DateTime _date = DateTime.now();
  Color _color = Colors.purple;
  String _fileName = "";

  var nameUpdate = TextEditingController();
  var phoneUpdate = TextEditingController();
  DateTime _dateUpdate = DateTime.now();
  Color _colorUpdate = Colors.purple;
  String _fileNameUpdate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts BLoC"),
        centerTitle: true,
      ),
      drawer: const DrawerGlobal(),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                  buildContactList(state.value),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildAddForm() {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              TextFieldGlobal(
                label: "Name",
                controller: name,
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
                controller: phone,
                validator: (value) {
                  if (Validator().validatePhone(value) != null) {
                    return Validator().validatePhone(value);
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DatePicker1(
                date: _date,
                onChange: (DateTime value) {
                  setState(
                    () {
                      _date = value;
                    },
                  );
                },
              ),
              ColorPicker1(
                color: _color,
                onChange: (Color color) {
                  setState(
                    () {
                      _color = color;
                    },
                  );
                },
              ),
              FilePicker1(
                value: _fileName,
                onChange: (value) {
                  setState(
                    () {
                      _fileName = value;
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
                      if (!formKey.currentState!.validate()) return;

                      context.read<ContactBloc>().add(
                            AddContact(
                              contact: Contact(
                                title: name.text,
                                subtitle: phone.text,
                                color: _color,
                                date: _date,
                                file: _fileName,
                              ),
                            ),
                          );

                      name.text = "";
                      phone.text = "";
                      _color = Colors.purple;
                      _date = DateTime.now();
                      _fileName = "";
                    },
                    child: const Text("Submit"),
                  )
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  Widget buildUpdateForm(int index, StateSetter setState) {
    return Form(
      key: formKeyUpdate,
      child: Column(
        children: [
          TextFieldGlobal(
            label: "Name",
            controller: nameUpdate,
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
            controller: phoneUpdate,
            validator: (value) {
              if (Validator().validatePhone(value) != null) {
                return Validator().validatePhone(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DatePicker1(
            date: _dateUpdate,
            onChange: (DateTime value) {
              setState(
                () {
                  _dateUpdate = value;
                },
              );
            },
          ),
          ColorPicker1(
            color: _colorUpdate,
            onChange: (Color color) {
              setState(
                () {
                  _colorUpdate = color;
                },
              );
            },
          ),
          FilePicker1(
            value: _fileNameUpdate,
            onChange: (value) {
              setState(
                () {
                  _fileNameUpdate = value;
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
    await showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            return AlertDialog(
              title: const Text("Update Contact"),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SingleChildScrollView(
                    child: buildUpdateForm(index, setState),
                  );
                },
              ),
              // content: buildUpdateForm(index, setState),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(
                          UpdateContact(
                            index: index,
                            contact: Contact(
                              title: nameUpdate.text,
                              subtitle: phoneUpdate.text,
                              date: _dateUpdate,
                              color: _colorUpdate,
                              file: _fileNameUpdate,
                            ),
                          ),
                        );
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget buildContactList(contacts) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            var data = contacts[index];
            return ContactListTile(
              data: data,
              onUpdate: () {
                nameUpdate.text = contacts[index].title;
                phoneUpdate.text = contacts[index].subtitle;
                _dateUpdate = contacts[index].date;
                _colorUpdate = contacts[index].color;
                _fileNameUpdate = contacts[index].file;
                onUpdate(index);
              },
              onDelete: () {
                context.read<ContactBloc>().add(DeleteContact(index: index));
              },
            );
          },
        );
      },
    );
  }
}
