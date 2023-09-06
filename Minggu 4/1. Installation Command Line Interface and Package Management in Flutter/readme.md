 ## Installation – Command Line Interface
- 📝 Latihan –  Installation – Command Line Interface - [(GoogleDocs)](https://docs.google.com/document/d/1B0FXuWiyPTs0hA4uVUgxZA3XXinDbLGt/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)
- 📝 Resume Materi KMFlutte –  Installation – Command Line Interface - [(GoogleDocs)](https://docs.google.com/document/d/19eDjdL6PwbhUsjwTaJkUMJR9_ZX3pQaj/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)

---
### Flutter CLI
Adalah alat yang digunakan untuk berinteraksi dengan flutter SDK, berupa perintah perintah yang dapat dijalankan di terminal.

---
### CLI Commands
```
flutter doctor 
//untuk melakukan pemeriksaan terhadap software yang dibutuhkan flutter apakah sudah terinstall

flutter create 
//untuk membuat projek flutter baru

flutter run 
//untuk menjalankan projek flutter

flutter emulator
/untuk mengkofigurasi emulatoryang akan digunakan

flutter channel
//untuk memeriksa versi flutter yang digunakan (versi stabil, beta atau experimetal)

flutter pub
//untuk mendownload dependency yang ada di pubspec.yaml atau menambahkan dependecy baru

flutter build
//untuk menjalankan proses build ke tahap produksi dalam bentu apk, ipa dll

flutter clean
//untuk membersihkan projek (menghapus build dan package yang sudah di install)
```

---

### Package Management
Flutter mendukung sharing packages, packages yang dibuat developer lain, mempercepat pengembangan aplikasi.

Mendapatkan packages di website pub.dev
 Copy command installation ke terminal di directory folder projek
 
Cohtoh:
```
Dart pub get http
```

Atau dengan ccara mengubah dependecy di pubspec.yaml
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  // tambahkan package disini
```

Untuk menggunakan package yang telah di install,import package di file dart agar dapat digunakan dengan cara

```
import 'package:... //nama package yang ingin di gunakan';
```
