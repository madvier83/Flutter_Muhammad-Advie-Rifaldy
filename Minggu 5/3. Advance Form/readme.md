# Form & Advance Form Input

### Form
Didalam statefull widget form memerlukan key dan widget form. Formkey digunakan untuk membuat trigger untuk menjalankan penglolahan data dll.

Contoh:
```
  var formKey = GlobalKey<FormState>();

  Widget buildAddForm() {
    return Form(
      key: formKey,
      child: Column(... //text input, tombol submit dll...)
    )
  }
```

Formkey dapat digunakan untuk menjalankan validasi contohnya

```
FilledButton(
    onPressed: () => {
        if (formKey.currentState?.validate() ?? false)
        {
            // print("name : ${name.text} \nphone: ${phone.text}")
            setState(() {
                addContact();
                debugPrint(listContact.toString());
            })
        }
    },
    child: const Text("Submit"),
)
```

---
### Input

Ada berbagai macam tipe input di flutter cohtohnya TextField, Radio, ChekcBox, DropdownButton (mirip select di html), Button dll.

Contoh penggunaan textfield
```
// TextEditing controller, dapat digunakan untuk mendapatkan value dari form yang menggunakan controller tersebut

var phone = TextEditingController();



// Widget TextField
TextFormField(
    controller: phone,
    validator: (value) {
        if (validatePhone(value) != null) {
            return validatePhone(value);
        }
        return null;
    },
    decoration: const InputDecoration(
        filled: true,
        labelText: 'Phone',
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
),
```
---
### Button

Button adalah tipe input yang digunakan untuk menjalankan perintah.

Contoh penggunaan button:

```
FilledButton(
    onPressed: () => {
        if (formKey.currentState?.validate() ?? false)
        {
            // print("name : ${name.text} \nphone: ${phone.text}")
            setState(() {
                addContact();
                debugPrint(listContact.toString());
            })
        }
},
```
<br>
<br>
<br>
<br>

# Advance Form

### Datepicker

Untuk memilih tanggal di flutter dapat menggunakan widget ShowDatePicker, ShowDatePicker memunculkan sebuah modal yang memiliki kalender didalamnya, setelah selesai memilih tangga tanggal dapat disimpan di variable, karena ShowDatePicker merupakan aksi async maka hasil pilihan tanggal harus ditunggu dengan await.

Contoh:
```
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
```

Hasil dari ShowDatePicker merupakan tipe data berbentuk DateTime, DateTime dapat di format menjadi tanggal yang lebih mudah dibaca dengan library intl.

---

### Color picker

Widget dimana user dapat memilih warna. Cara membuat color picker diperlukan third party library, salah satunya yaitu flutter_colorpicker.

Cara menggunakan flutter_colorpicker contohnya:
```

// hasil disimpan di variable bertipedata Color
  Color _currentColor = Colors.orange;
  Color _tempColor = Colors.orange;

// Contoh menampilkan widget colorpicker di dalam alert box
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
```

Cara penggunaan dan tipe tipe lain dari library tersebut dapat dilihat di dokumentasi flutter_colorpicker

---
### Filepicker

Untuk membuat filepicker juga membutuhkan thirdparty library agar lebih mudah yaitu library file_picker dan open_file untuk membuka file.

Cohtoh:
```
// Tombol untuk menjalankan filepicker
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

// fungsi yang digunakan untuk membuka folder dari device yang dipakai untuk memilih file
  void _pickFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

// library openfile dapat digunakan untuk membuka file yang telah dipilih
  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
```

Untuk mendapatkan data data dari file yang dipilih terdapat pada objek result, seperti data nama file, nama lokasi file dll.

cohtoh untuk mengambil nama file
```

//Tipedata platformfile dibutuhkan untuk menyimpan hasil dari filepicker

  String _fileName = "";
  PlatformFile? _filePath;

  void _pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result == null) return;

    setState(() {
      _fileName = result.files.first.name;
      _filePath = result.files.first;
    });

  }
```