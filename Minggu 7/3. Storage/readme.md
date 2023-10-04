# Shared Preference
Shared Preferences adalah salah satu mekanisme penyimpanan data sederhana yang digunakan dalam pengembangan aplikasi Android. 
Shared Preferences cocok untuk menyimpan data sederhana seperti pengaturan pengguna, preferensi, dan informasi sesi.

Pertama, tambahkan dependensi shared_preferences ke dalam file pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.7
```

Cara menyimpan data
```
// Mendapatkan instance Shared Preferences
SharedPreferences prefs = await SharedPreferences.getInstance();

// Menyimpan data dengan kunci dan nilai tertentu
prefs.setString('nama', 'John Doe');
prefs.setInt('umur', 25);
prefs.setBool('berlangganan', true);
```

Cara mengambil data
```
// Mendapatkan instance Shared Preferences
SharedPreferences prefs = await SharedPreferences.getInstance();

// Mengambil data berdasarkan kunci
String nama = prefs.getString('nama');
int umur = prefs.getInt('umur');
bool berlangganan = prefs.getBool('berlangganan');
```

Cara menghapus data
```
// Mendapatkan instance Shared Preferences
SharedPreferences prefs = await SharedPreferences.getInstance();

// Menghapus data berdasarkan kunci
prefs.remove('nama');

// Membersihkan semua data yang disimpan
prefs.clear();
```

# Local Databasae SQLite

Tambahkan dependensi sqflite ke dalam file pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.0.0
```

Inisialisasi database dan table
```
```
Database helper
```
```
Model data
```
```