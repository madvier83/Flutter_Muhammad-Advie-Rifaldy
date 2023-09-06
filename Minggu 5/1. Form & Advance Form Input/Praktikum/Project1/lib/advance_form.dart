import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class AdvanceForm extends StatefulWidget {
  const AdvanceForm({super.key});

  @override
  State<AdvanceForm> createState() => _AdvanceFormState();
}

class _AdvanceFormState extends State<AdvanceForm> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Colors.orange;
  Color _tempColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // datepicker
            const SizedBox(height: 16),
            buildDatePicker(context),
            const SizedBox(height: 16),
            const Divider(),
            // color picker
            const SizedBox(height: 16),
            buildColorPicker(context),
            const SizedBox(height: 16),
            const Divider(),
            // file picker
            const SizedBox(height: 16),
            buildFilePicker(context),
            const SizedBox(height: 16),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date Picker",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('dd MMMM yyyy').format(_dueDate),
            ),
            FilledButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                if (selectDate != null) {
                  setState(() {
                    _dueDate = selectDate;
                  });
                }
              },
              child: const Text("Select Date"),
            ),
          ],
        )
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color Picker",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 36,
              width: 240,
              decoration: BoxDecoration(
                color: _currentColor,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Pick Color"),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                            pickerColor: _currentColor,
                            onColorChanged: (color) {
                              setState(() {
                                _tempColor = color;
                              });
                            }),
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
                              _currentColor = _tempColor;
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_currentColor),
              ),
              child: const Text("Select Color"),
            )
          ],
        )
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "File Picker",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                _pickFile();
              },
              child: const Text("Select File"),
            )
          ],
        )
      ],
    );
  }

  void _pickFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
