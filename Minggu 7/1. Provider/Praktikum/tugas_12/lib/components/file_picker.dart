import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePicker1 extends StatefulWidget {
  final String value;
  final Function(String) onChange;
  const FilePicker1({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  State<FilePicker1> createState() => _FilePicker1State();
}

class _FilePicker1State extends State<FilePicker1> {
  @override
  Widget build(BuildContext context) {
    return buildFilePicker(context);
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.value,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: FilledButton.tonal(
                onPressed: () {
                  _pickFile();
                },
                child: const Text("Select File"),
              ),
            )
          ],
        )
      ],
    );
  }

  void _pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result == null) return;

    // final file = result.files.first;
    setState(() {
      widget.onChange(result.files.first.name);
      // _filePath = result.files.first;
    });
    // _openFile(file);
  }

  // void _openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }
}
