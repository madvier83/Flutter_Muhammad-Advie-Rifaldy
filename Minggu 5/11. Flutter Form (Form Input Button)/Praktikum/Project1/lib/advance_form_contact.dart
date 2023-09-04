import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
// import 'package:open_file/open_file.dart';
// import 'package:prioritas1/widgets/contact_list.dart';

class AdvanceFormContact extends StatefulWidget {
  const AdvanceFormContact({super.key});

  @override
  State<AdvanceFormContact> createState() => _AdvanceFormContactState();
}

class Contact {
  String title;
  String subtitle;
  DateTime date;
  Color color;
  String file;

  Contact({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
    required this.file,
  });
}

class _AdvanceFormContactState extends State<AdvanceFormContact> {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var phone = TextEditingController();

  var formKeyUpdate = GlobalKey<FormState>();
  var nameUpdate = TextEditingController();
  var phoneUpdate = TextEditingController();

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.purple;
  Color _tempColor = Colors.purple;
  String _fileName = "";
  PlatformFile? _filePath;

  List<Contact> listContact = [
    Contact(
      title: "M Advie Rifaldy",
      subtitle: "082376932445",
      color: Colors.tealAccent,
      date: DateTime.now(),
      file: "image.png",
    )
  ];

  // CRUD Contact
  void addContact() {
    setState(() {
      listContact.add(
        Contact(
          title: name.text,
          subtitle: phone.text,
          color: _currentColor,
          date: _dueDate,
          file: _fileName,
        ),
      );
      name.text = "";
      phone.text = "";
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  void updateContact(index) {
    setState(
      () {
        listContact[index] = Contact(
          title: nameUpdate.text,
          subtitle: phoneUpdate.text,
          color: _currentColor,
          date: _dueDate,
          file: _fileName,
        );
      },
    );
  }

  void deleteContact(index) {
    setState(() {
      listContact.removeAt(index);
    });
  }

  // Validator
  String? validateName(value) {
    if (value?.isEmpty ?? false) {
      return 'Nama harus di isi';
    }
    List<String>? words = value?.trim().split(" ");
    if ((words?.length ?? 0) < 2) {
      return 'Nama harus terdiri dari minimal 2 kata';
    }
    if (words != null) {
      for (int i = 0; i < words.length; i++) {
        if (words[i] != "" && words[i][0] != words[i][0].toUpperCase()) {
          return 'Setiap kata harus dimulai dengan huruf kapital';
        }
      }
    }
    RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(value)) {
      return 'Nama tidak boleh mengandung angka atau karakter khusus';
    }
    return null;
  }

  String? validatePhone(value) {
    if (value?.isEmpty ?? false) {
      return 'Nomor telepon harus di isi';
    }
    if ((value?.length ?? 0) <= 8) {
      return 'Panjang nomor telepon harus minimal 8 digit';
    }
    if ((value?.length ?? 0) >= 15) {
      return 'Panjang nomor telepon maksimal 15 digit';
    }
    if (value[0] != "0") {
      return 'Nomor telepon harus dimulai dengan angka 0';
    }
    RegExp regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value)) {
      return 'Nomor telepon harus terdiri dari angka saja';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 64),
              const Icon(Icons.contacts_outlined),
              const SizedBox(height: 16),
              const Text(
                "Create New Contact",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      "A dialog is a type of modal windows that appears in front of app content to provide critical information, or prompt for a descision to be made",
                      textAlign: TextAlign.center,
                    ),
                    Divider(height: 32),
                  ],
                ),
              ),
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: name,
            validator: (value) {
              if (validateName(value) != null) {
                return validateName(value);
              }
              return null;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Name',
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: phone,
            validator: (value) {
              if (validatePhone(value) != null) {
                return validatePhone(value);
              }
              return null;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Phone',
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),

          const SizedBox(height: 16),
          buildDatePicker(context),
          // color picker
          buildColorPicker(context),
          // file picker
          buildFilePicker(context),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () => {
                  if (formKey.currentState?.validate() ?? false)
                    {
                      // print("name : ${name.text} \nphone: ${phone.text}")
                      setState(() {
                        addContact();
                        debugPrint(listContact.toString());
                      })
                    }
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

  Widget buildUpdateForm(index) {
    return Form(
      key: formKeyUpdate,
      child: Column(
        children: [
          TextFormField(
            controller: nameUpdate,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Name',
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            validator: (value) {
              if (validateName(value) != null) {
                return validateName(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: phoneUpdate,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Phone',
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            validator: (value) {
              if (validatePhone(value) != null) {
                return validatePhone(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          buildDatePicker(context),
          // color picker
          buildColorPicker(context),
          // file picker
          buildFilePicker(context),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildContactList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: listContact.length,
      itemBuilder: (context, index) {
        var data = listContact[index];
        return Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: data.color.withOpacity(0.2),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                leading: CircleAvatar(
                  backgroundColor: data.color,
                  child: Text(
                    data.title[0],
                  ),
                ),
                title: Text(data.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.subtitle),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        nameUpdate.text = data.title;
                        phoneUpdate.text = data.subtitle;
                        _dueDate = data.date;
                        _currentColor = data.color;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Update Contact"),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      buildUpdateForm(index),
                                    ],
                                  )
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Handle the cancel action
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancel"),
                                ),
                                FilledButton(
                                  onPressed: () => {
                                    if (formKeyUpdate.currentState
                                            ?.validate() ??
                                        false)
                                      {
                                        setState(() {
                                          updateContact(index);
                                          Navigator.pop(context);
                                        })
                                      }
                                  },
                                  child: const Text("Update"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.mode_edit_outline_outlined),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () => deleteContact(index),
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Date: ${DateFormat("dd MMMM yyyy").format(data.date)}"),
                    Text("File: ${data.file}"),
                    Row(
                      children: [
                        const Text("Color: "),
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: data.color,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        );
      },
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd MMMM yyyy').format(_dueDate),
            ),
            SizedBox(
              width: 120,
              child: FilledButton.tonal(
                onPressed: () async {
                  final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(currentDate.year + 5),
                  );
                  if (selectDate != null) {
                    setState(() {
                      _dueDate = selectDate;
                    });
                  }
                },
                child: const Text("Select Date"),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 36,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: _currentColor,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
            SizedBox(
              width: 120,
              child: FilledButton.tonal(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Pick Color"),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                              pickerColor: _currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _tempColor = color;
                                });
                              }),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          ),
                          FilledButton(
                            onPressed: () {
                              setState(() {
                                _currentColor = _tempColor;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Save"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Select Color"),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(_fileName, overflow: TextOverflow.fade),
            ),
            SizedBox(
              width: 120,
              child: FilledButton.tonal(
                onPressed: () {
                  _pickFile();
                },
                child: const Text("Select File"),
              ),
            )
          ],
        )
      ],
    );
  }

  void _pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result == null) return;

    // final file = result.files.first;
    setState(() {
      _fileName = result.files.first.name;
      _filePath = result.files.first;
    });
    // _openFile(file);
  }

  // void _openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }
}
