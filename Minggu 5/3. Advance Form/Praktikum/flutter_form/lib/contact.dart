import 'package:flutter/material.dart';
// import 'package:prioritas1/widgets/contact_list.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var phone = TextEditingController();

  var formKeyUpdate = GlobalKey<FormState>();
  var nameUpdate = TextEditingController();
  var phoneUpdate = TextEditingController();

  var listContact = [
    {"title": "M Advie Rifaldy", "subtitle": "082376932445"},
  ];

  // CRUD Contact
  void addContact() {
    setState(() {
      listContact.add({"title": name.text, "subtitle": phone.text});
      name.text = "";
      phone.text = "";
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  void updateContact(index) {
    setState(() {
      listContact[index] = {
        "title": nameUpdate.text,
        "subtitle": phoneUpdate.text,
      };
    });
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
              addFormBuilder(),
              const Text(
                "List Contacts",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),
              contactListBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget addFormBuilder() {
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

  Widget updateFormBuilder(index) {
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
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: () => {
                  if (formKeyUpdate.currentState?.validate() ?? false)
                    {
                      setState(() {
                        updateContact(index);
                        Navigator.pop(context);
                      })
                    }
                },
                child: const Text("Update"),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget contactListBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: listContact.length,
      itemBuilder: (context, index) {
        var data = listContact[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          leading: CircleAvatar(
            child: Text(
              data["title"]?[0] ?? "-",
            ),
          ),
          title: Text(data["title"] ?? "-"),
          subtitle: Text(data["subtitle"] ?? "-"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  nameUpdate.text = data["title"] ?? "";
                  phoneUpdate.text = data["subtitle"] ?? "";
                  showModalBottomSheet(
                    useSafeArea: true,
                    isScrollControlled: true,
                    showDragHandle: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Update Contact",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22),
                            ),
                            const SizedBox(height: 16),
                            updateFormBuilder(index),
                          ],
                        ),
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
        );
      },
    );
  }
}
