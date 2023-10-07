import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_api/models/contact_model.dart';
import 'package:tugas_api/screens/home/home_screen_model.dart';

class AddContactForm extends StatefulWidget {
  const AddContactForm({super.key});

  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: value.nameController,
              decoration: const InputDecoration(
                label: Text("Name"),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: value.phoneController,
              decoration: const InputDecoration(
                label: Text("Phone"),
                filled: true,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.tonal(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                FilledButton(
                  onPressed: () async {
                    var req = ContactModel(
                      name: value.nameController.text,
                      phone: value.phoneController.text,
                    );
                    await value.createContact(req);
                  },
                  child: const Text("Post"),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text("Response : ${value.postResponse}"),
          ],
        );
      },
    );
  }
}
