import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_api/bloc/contact/contact_bloc.dart';
import 'package:tugas_api/models/contact_helper.dart';
import 'package:tugas_api/models/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> _idFormKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();

  String request = "request";
  String response = "response";

  final Dio dio = Dio();

  Future<String> createContact({required ContactModel contact}) async {
    String url =
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts";
    try {
      var req = {
        "name": contact.name,
        "phone": contact.phone,
      };
      Response res = await dio.post(
        url,
        data: req,
      );
      return res.toString();
    } catch (err) {
      return ":Error";
    }
  }

  Future<ContactModel?> getContactById(int id) async {
    String url =
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id";
    try {
      final res = await dio.get(url);
      final ContactModel data = ContactHelper().toMap(json: res.toString());
      return data;
    } catch (err) {
      return null;
    }
  }

  ContactModel? contactById;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tugas Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Name"),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  label: Text("Phone"),
                  filled: true,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 8,
              ),
              FilledButton(
                onPressed: () async {
                  var req = ContactModel(
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                  response = await createContact(contact: req);
                  request = req.toString();
                  setState(() {});

                  nameController.clear();
                  phoneController.clear();
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                child: const Text("Post"),
              ),
              const SizedBox(
                height: 8,
              ),
              Text("Request : $request"),
              Text("Response : $response"),
              const Divider(height: 64),
              const Row(
                children: [
                  Text(
                    "Get Contact By Id",
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
              Text("Name : ${contactById?.name}"),
              Text("Phone : ${contactById?.phone}"),
              Form(
                key: _idFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: idController,
                      decoration: const InputDecoration(
                        label: Text("Id"),
                        filled: true,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return "Required";
                        }
                        return null;
                      },
                    ),
                    FilledButton(
                      onPressed: () async {
                        if (!_idFormKey.currentState!.validate()) return;
                        contactById =
                            await getContactById(int.parse(idController.text));
                        setState(() {});
                      },
                      child: const Text("Get Contact By Id"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
