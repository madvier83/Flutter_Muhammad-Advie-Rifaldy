# Assets, Dialog Bottomsheet, Navigation


## Assets
adalah file yang di bundle dan di deploy bersamaan dengan aplikasi, tipe tipe assets contohnya static data seperti JSON file, icons, image, font dll.

Cara menggunakan asset yaitu dengan mendaftarkan file atau folder kedalam bagian assets di file pubspec.yaml

Cohtoh:
```
  assets:
     - images/a_dot_burr.jpeg
     - images/a_dot_ham.jpeg
```

Atau dengan langsung mendaftarkan seluruh folder seperti

```
   assets:
     - images/
     - fonts/
```

nama tersebut adalah nama direktori dari file asset yang akan digunakan.

## image

image atau gambar dapat digunakan sebagai asset pada flutter, flutter mendukung format gambar seperti JPEG, PNG, GIF, BMP, WBMP WEBP dll.

```
// cara penggunaan image dari asset contohnya:
    Image(
        image: AssetImage("...");
    )

// atau

    Image.asset("...");
    Image.network("... url gambar dari internet");
```

## Font

Salah satu cara mengganti font di flutter adalah dengan menggunakan asset font yang dapat di download dari googlefonts dll.

Setelah font di daftarkan di pubspec.yaml font dapat digunakan cohtohnya melalui themedata

```
    return MaterialApp(
        theme: ThemeData(fontFamily: "poppins"),
    );

    // nama font disesuaikan dengan nama font yang di pakai
```

Cara lainya yaitu menggunakan package google fonts yang bisa di download di dartpub

## Alert Dialog

Alert dialog adalah sebuah popup/modal untuk menginformasikan hal tertentu dan menerima input dari user.

Cohtoh:
```
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Are your sure?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: onPressed,
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete_forever_rounded),
          )
```


## Bottom sheet

Sama dengan alert dialog tetapi bottom sheet muncul dari bawah layar, biasa digunakan untuk menampilkan informasi yang lebih banyak.

Cohtoh:
```
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const SizedBox(
                    width: double.infinity,
                    child: ProfileSheet(),
                  );
                },
              );
            },
            icon: const Icon(Icons.account_circle),
          )
```

## Flutter navigation

Untuk berpindah dari satu halaman ke halaman lain digunakan navigation

Contoh penggunaan navigation
```
// cohtoh
Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) {
        return GalleryDetail(
        item: selectedItem,
        );
    },
    ),
);

// kembali ke halaman sebelumnya/menutup halaman yang di push
Navigator.of(context).pop();

// named route
Navigator.of(context).pushNamed("/contact");
```

Untuk menggunakan named route perlu mendaftarkan route pada materialapp

Cohtohnya:
```
      initialRoute: "/",
      routes: {
        "/": (context) => const GalleryScreen(),
        "/contact": (context) => const AdvanceFormContact(),
      },
```