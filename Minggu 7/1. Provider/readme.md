# Flutter State Management (Provider)

Cara menggunakan provider maka perlu menginstall terlebih dahulu package provider.

```
flutter pub get provider
```

Selanjutnya provider dapat dibuat dalam sebuah class yang melakukan extends ke change notifier agar perubahan dalam class dapat terdeteksi oleh seluruh aplikasi

Contoh store:
```
class ContactAdvanceStore with ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(int index, Contact contact) {
    _contacts[index] = contact;
    notifyListeners();
  }
}
```

Cara mendaftarkan provider yang telah dibuat bisa mneggunakan multi provider

```
Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => contact_store.Contact(),
        ),
        ChangeNotifierProvider(
          create: (context) => contact_advance_store.ContactAdvanceStore(),
        ),
      ],
      child: MaterialApp()
    )
}
```

Cara menggunakan provider di seluruh widget dapat menggunakan

```    
final contactProvider = Provider.of<ContactAdvanceStore>(context);
```

Contact provider tersebut berisi seluruh data dari store yang telah di daftarkan

Contoh pemanggilan fungsi dari store
```
contactProvider.addContact(
    Contact(
        title: name.text,
        subtitle: phone.text,
        color: _color,
        date: _date,
        file: _fileName,
    ),
);
```