import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weekly 1"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 64, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Need to get in touch with us? Either fill out the form with your inquiry or find the department email you'd like to contact below.",
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  TextFieldGlobal(
                    label: "First name*",
                  ),
                  TextFieldGlobal(
                    label: "Last name",
                  ),
                  TextFieldGlobal(
                    label: "Email*",
                  ),
                  TextFieldGlobal(
                    label: "What can we help you with?",
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldGlobal extends StatelessWidget {
  final String label;
  int? maxLines;

  TextFieldGlobal({
    required this.label,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
          ),
        ),
      ],
    );
  }
}
