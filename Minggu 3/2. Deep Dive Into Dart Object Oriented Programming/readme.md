## Deep Dive Into Dart Object Oriented Programming
  - 📝 Latihan – Deep Dive Into Dart Object Oriented Programming - [(GoogleDocs)](https://docs.google.com/document/d/1cYvcAfcxAeNYRkzA383vCWHJMbahnqGN/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)
  - 📝 Resume Materi KMFlutter – Deep Dive Into Dart Object Oriented Programming - [(GoogleDocs)](https://docs.google.com/document/d/1wDTO6DWuWAEY767RWGlHRt9yEt7lcogT/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)
---
### Constructor
Method yang dijalankan saat pembuatan object, dapat menerima parameter, tidak memiliki return, nama sama dengan nama classnya.

Contoh:
```
class Gelas {
    int volume = 0;

	Gelas(int v) {
		this.volume = v
	}
}
```
---
### Inheritance
Membuat class baru dengan memanfaatkan class yang ada, 
Bertujuan agar kemampuan class yang sudah ada dapat dimiliki class baru.

Contoh:
```
class Shape {
  	int getArea();
}
class Circle extends Shape {}
```
---
### Overriding 
Menulis ulang method yang ada di superclass

Contoh:
```
@override
  int getArea() {
    // kode baru
  }
  ```
---
### Interface
Class yang hanya menunjukan method dan property apa saja yang dibutuhkan dalam satu class, seluruh method wajib di override

Contoh:
```
class Shape {
  int getArea();
  int getPerimeter();
}
class Circle implements Shape {//setiap method harus di override}
```
---
### Abstract class
Class yang hanya menunjukan method dan property apa saja yang dibutuhkan dalam satu class, tidak dapat langsugn dibuat object

Contoh:
```
abstract class Shape {
  int getArea();
  int getPerimeter();
}
```
---
### Polimorphism
Kemampuan mengubah data menjadi bentuk lain, tipe data yang digunakan adalah superclassnya.

---
### Generics
Dapat digunakan pada class atau fungsi, memberikan kemampuan untuk menerima data dengan tipe yang berbeda
