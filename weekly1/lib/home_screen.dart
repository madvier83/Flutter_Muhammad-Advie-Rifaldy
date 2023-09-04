import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weekly 1"),
        // centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
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
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: TextFieldGlobal(
                          controller: _firstName,
                          label: "First name*",
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: TextFieldGlobal(
                          controller: _lastName,
                          label: "Last name",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFieldGlobal(
                    controller: _email,
                    label: "Email*",
                  ),
                  const SizedBox(height: 8),
                  TextFieldGlobal(
                    controller: _message,
                    label: "What can we help you with?",
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () {
                      // if(_formkey.currentState?.validate()) {
                      // print({
                      //   "name": "${_firstName.text} ${_lastName.text}",
                      //   "email": _email.text,
                      //   "message": _message.text,
                      // });
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Form data"),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Name: ${_firstName.text} ${_lastName.text}"),
                                  Text("Email: ${_email.text}"),
                                  Text("Message: ${_message.text}"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        },
                      );
                      // }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade900),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    child: const Text("Submit"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldGlobal extends StatelessWidget {
  final String label;
  int? maxLines;
  var controller;

  TextFieldGlobal({
    required this.label,
    required this.controller,
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
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 211, 211, 211)),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
          ),
        ),
      ],
    );
  }
}
