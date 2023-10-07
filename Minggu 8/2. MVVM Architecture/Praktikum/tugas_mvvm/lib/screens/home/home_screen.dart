import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_api/screens/home/home_screen_model.dart';
import 'package:tugas_api/screens/home/widgets/add_contact_form_widget.dart';
import 'package:tugas_api/screens/home/widgets/post_update_form_widget.dart';
import 'package:tugas_api/screens/home/widgets/search_bar_widget.dart';
import 'package:tugas_api/widgets/botton_navigation_bar_global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeViewModel>(context, listen: false);
      provider.getContacts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas API & MVVM"),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              const HomeSearchBar(),
              value.isLoadingContact
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.contacts.length,
                      itemBuilder: (context, index) {
                        final item = value.contacts[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(item.id.toString()),
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.phone),
                        );
                      },
                    ),
            ],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "btn1",
            backgroundColor: const Color.fromARGB(255, 40, 102, 41),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Update Post",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PostUpdateForm(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text("Update Post"),
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return const Dialog(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add Contact",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            AddContactForm(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Contact"),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarGlobal(),
    );
  }
}
