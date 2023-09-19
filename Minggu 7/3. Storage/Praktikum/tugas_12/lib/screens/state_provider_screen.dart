import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_12/components/drawer_global.dart';
import 'package:tugas_12/models/contact_model.dart';
import 'package:tugas_12/stores/contact.dart' as contact_store;

class StateProvider extends StatefulWidget {
  const StateProvider({super.key});

  @override
  State<StateProvider> createState() => _StateProviderState();
}

class _StateProviderState extends State<StateProvider> {
  var formKey = GlobalKey<FormState>();
  String name = "";
  String phone = "";
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provider"),
        centerTitle: true,
      ),
      drawer: const DrawerGlobal(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                onChanged: (value) {
                  name = value;
                },
                decoration:
                    const InputDecoration(filled: true, labelText: "Name"),
              ),
              TextField(
                controller: _phoneController,
                onChanged: (value) {
                  phone = value;
                },
                decoration:
                    const InputDecoration(filled: true, labelText: "phone"),
              ),
              FilledButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;
                  formKey.currentState!.save();
                  contactProvider.add(GetContact(name: name, phone: phone));
                },
                child: const Text("Add Contact"),
              ),
              ListView.builder(
                itemCount: contactProvider.contacts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contactProvider.contacts[index].name),
                    subtitle: Text(contactProvider.contacts[index].phone),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
