import 'package:flutter/material.dart';

class GetContact {
  String name = "";
  String phone = "";

  GetContact({
    required this.name,
    required this.phone,
  });
}

class Contact {
  String title;
  String subtitle;
  DateTime date;
  Color color;
  String file;

  Contact({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
    required this.file,
  });
}
