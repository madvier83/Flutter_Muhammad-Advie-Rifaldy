import 'package:flutter/material.dart';
import 'package:tugas_12/components/drawer_global.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter setState"),
        centerTitle: true,
      ),
      drawer: const DrawerGlobal(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$number"),
            FilledButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
