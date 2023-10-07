import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_api/models/contact_model.dart';
import 'package:tugas_api/models/post_model.dart';
import 'package:tugas_api/screens/home/home_screen_model.dart';

class PostUpdateForm extends StatefulWidget {
  const PostUpdateForm({super.key});

  @override
  State<PostUpdateForm> createState() => _PostUpdateFormState();
}

class _PostUpdateFormState extends State<PostUpdateForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: value.titleController,
              decoration: const InputDecoration(
                label: Text("Title"),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: value.bodyController,
              decoration: const InputDecoration(
                label: Text("Body"),
                filled: true,
              ),
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
                    var req = PostModel(
                      id: 1,
                      title: value.titleController.text,
                      body: value.bodyController.text,
                      userId: 1,
                    );
                    await value.updatePost(post: req);
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text("Response : ${value.putResponse}"),
          ],
        );
      },
    );
  }
}
