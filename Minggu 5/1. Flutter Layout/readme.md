## Platform Widget
- 📝 Latihan –  Platform Widget - [(GoogleDocs)](https://docs.google.com/document/d/1FnN4DfGq50gP7lbvXzWu8HYoFW5v2MVi/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)
- 📝 Resume Materi KMFlutte –  Platform Widget - [(GoogleDocs)](https://docs.google.com/document/d/1muoMcKT1CZiZgS__VF1isqSVBvw4KtJg/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)

---
### Flutter platform widget
Memanfaatkan widget dengan gaya berbeda pada android dan ios

---
### Material App
Adalah widget dasar yang mengemas seluruh aplikasi, widget digunakan pada sistem android.

Contoh:
```
MaterialApp(
	Theme: Themedata.dark(),
	Home: const HomePage(),
);
```

---
### Scaffold
Adalah widget dasar untuk membangun sebuah halaman apda material app

Struktur scaffold memiliki appbar, body, bottom navigation bar, drawer, floating action button dll

Contoh:
```
MaterialApp(
	Theme: Themedata.dark(),
	Home: const Scaffold(
        appbar: //header aplikasi,
        body: //isi aplikasi,
        bottomNavigationBar: //menu navigasi dibawah app
        floatingActionButton: //tombol aksi
        drawer: //sidebar dari aplikasi
    ),
);
```
---
### Cupertino App
Adalah widget dasar yang mengemas seluruh widget dalam aplikasi, widget digunakan pada sistem ios.

Contoh:
```
CupertinoApp (
	Theme: _themeDark,
	Home: const HomePage(),
);
```

---
### Cupertino Page Scaffold
Membentuk tata letak dasar sebuah halaman. Sama seperti scaffold hanya dengan properti yang berbeda

Struktur cupertino page scaffold terdiri dari navigation bar, child dll

Contoh:
```
CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Page'),
      ),
      child: Center(
        child: Text(
          'Hello, Cupertino!',
        ),
      ),
    ),
```
