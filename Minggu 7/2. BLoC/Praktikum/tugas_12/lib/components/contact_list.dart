import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_12/models/contact_model.dart';

class ContactListTile extends StatelessWidget {
  final Contact data;
  final Function() onUpdate;
  final Function() onDelete;
  const ContactListTile({
    super.key,
    required this.data,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
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
                  onPressed: onUpdate,
                  icon: const Icon(Icons.mode_edit_outline_outlined),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Delete?"),
                          actions: [
                            TextButton(
                              child: const Text("No"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              onPressed: () {
                                onDelete();
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );
                  },
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
                Text("Date: ${DateFormat("dd MMMM yyyy").format(data.date)}"),
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
  }
}
