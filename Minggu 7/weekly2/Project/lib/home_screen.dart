import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_validator/form_validator.dart';
import 'package:weekly1/widgets/drawer_global.dart';
import 'package:weekly1/widgets/text_field_global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  final emailValidator = ValidationBuilder().email().maxLength(32).build();
  final requiredValidator =
      ValidationBuilder().minLength(1).maxLength(255).build();
  final limitValidator = ValidationBuilder().maxLength(255).build();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.contact_support_rounded, color: Colors.blue),
            SizedBox(
              width: 4,
            ),
            Text("Flutter Contact"),
          ],
        ),
        // centerTitle: true,
      ),
      endDrawer: const DrawerGlobal(),
      body: ListView(
        children: [
          const SizedBox(height: 42),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/bg.svg",
                  width: 200,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/images/bg.svg",
                    width: 200,
                  ),
                ),
              ),
              Column(
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
                      child: buildContactForm())
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.flutter_dash),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Flutter Course",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Flutter adalah sebuah framework aplikasi mobile sumber terbuka yang diciptakan oleh Google. Flutter digunakan dalam pengembangan aplikasi untuk sistem operasi Android, iOS, Windows, Linux, MacOS, serta menjadi metode utama untuk membuat aplikasi Google Fuchsia.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.flutter_dash),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "React Course",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Flutter adalah sebuah framework aplikasi mobile sumber terbuka yang diciptakan oleh Google. Flutter digunakan dalam pengembangan aplikasi untuk sistem operasi Android, iOS, Windows, Linux, MacOS, serta menjadi metode utama untuk membuat aplikasi Google Fuchsia.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactForm() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextFieldGlobal(
                  controller: _firstName,
                  validator: requiredValidator,
                  label: "First name*",
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: TextFieldGlobal(
                  controller: _lastName,
                  validator: (value) {
                    return;
                  },
                  label: "Last name",
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextFieldGlobal(
            controller: _email,
            validator: emailValidator,
            label: "Email*",
          ),
          const SizedBox(height: 8),
          TextFieldGlobal(
            controller: _message,
            validator: requiredValidator,
            label: "What can we help you with?",
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                // print({
                //   "name": "${_firstName.text} ${_lastName.text}",
                //   "email": _email.text,
                //   "message": _message.text,
                // });
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Form data"),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${_firstName.text} ${_lastName.text}"),
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
                          child: const Text("Close"),
                        )
                      ],
                    );
                  },
                );
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
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
    );
  }
}
