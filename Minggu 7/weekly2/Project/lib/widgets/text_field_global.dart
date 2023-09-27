import 'package:flutter/material.dart';

class TextFieldGlobal extends StatelessWidget {
  final String label;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const TextFieldGlobal({
    required this.label,
    required this.controller,
    this.maxLines = 1,
    required this.validator,
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
        TextFormField(
          validator: (value) {
            return validator(value ?? "");
          },
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
