import 'package:flutter/material.dart';
import 'package:tugas_12/components/drawer_global.dart';

class CounterProvider extends StatefulWidget {
  const CounterProvider({super.key});

  @override
  State<CounterProvider> createState() => _CounterProviderState();
}

class _CounterProviderState extends State<CounterProvider> {
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
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
