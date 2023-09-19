import 'package:flutter/material.dart';

class TextFieldGlobal extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? label;
  const TextFieldGlobal({
    super.key,
    required this.controller,
    required this.validator,
    this.label,
  });

  @override
  State<TextFieldGlobal> createState() => _TextFieldGlobalState();
}

class _TextFieldGlobalState extends State<TextFieldGlobal> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final validator = widget.validator;
    final label = widget.label;

    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}
