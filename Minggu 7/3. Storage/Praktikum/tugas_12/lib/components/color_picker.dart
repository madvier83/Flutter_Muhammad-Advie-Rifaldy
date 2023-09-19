import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPicker1 extends StatefulWidget {
  final Color color;
  final Function(Color) onChange;
  const ColorPicker1({
    super.key,
    required this.color,
    required this.onChange,
  });

  @override
  State<ColorPicker1> createState() => _ColorPicker1State();
}

class _ColorPicker1State extends State<ColorPicker1> {
  final Color _tempColor = Colors.purple;

  @override
  Widget build(BuildContext context) {
    Color value = widget.color;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 36,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: value,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: FilledButton.tonal(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Pick Color"),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: value,
                            onColorChanged: widget.onChange,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          ),
                          FilledButton(
                            onPressed: () {
                              setState(() {
                                value = _tempColor;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Save"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Select Color"),
              ),
            )
          ],
        )
      ],
    );
  }
}
