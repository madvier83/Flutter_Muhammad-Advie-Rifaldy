import 'package:flutter/material.dart';
import 'package:flutter_storage/components/text_field_global.dart';
import 'package:flutter_storage/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    print("initState executed");
    super.initState();
    checkLogin(context);
  }

  void checkLogin(BuildContext context) async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool("login") ?? true;

    if (newUser == false) {
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      }
      // print("Logged in");
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas Storage & Shared Preferences"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFieldGlobal(
                controller: _usernameController,
                validator: (p0) {
                  return null;
                },
                label: "Username",
              ),
              TextFieldGlobal(
                controller: _emailController,
                validator: (p0) {
                  return null;
                },
                label: "Email",
              ),
              TextFieldGlobal(
                controller: _passwordController,
                validator: (p0) {
                  return null;
                },
                label: "Password",
                obscureText: true,
              ),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String username = _usernameController.text;
                    loginData.setBool("login", false);
                    loginData.setString("username", username);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/home",
                      (route) => false,
                    );
                  }
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
