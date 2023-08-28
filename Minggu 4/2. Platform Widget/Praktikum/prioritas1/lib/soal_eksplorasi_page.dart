import 'package:flutter/material.dart';

class SoalEksplorasiPage extends StatelessWidget {
  const SoalEksplorasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Learn Flutter",
      "Learn ReactJs",
      "Learn VueJS",
      "Learn TailwindCSS",
      "Learn UI/UX",
      "Learn Figma",
      "Learn Digital Marketing",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.search,
              color: Colors.white60,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(items[index]),
              ),
              const Divider(
                height: 0,
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        onPressed: null,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Information"),
        ],
      ),
    );
  }
}
