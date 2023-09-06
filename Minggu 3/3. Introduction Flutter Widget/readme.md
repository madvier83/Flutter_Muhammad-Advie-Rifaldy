## Introduction Flutter Widget
- 📝 Latihan – Introduction Flutter Widget - [(GoogleDocs)](https://docs.google.com/document/d/17klR-H-CAnWtkGVbnBfFu5xw7K-hGhoy/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)
- 📝 Resume Materi KMFlutte – Introduction Flutter Widget - [(GoogleDocs)](https://docs.google.com/document/d/1rvtqb3L2Xgm1p1eCvnxtPO-XvMZDKDmH/edit?usp=sharing&ouid=117292295682396853576&rtpof=true&sd=true)

## Perkenalan flutter
Flutter adalah alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop dan web

---
### Stateless widget
Tidak tergantung  pada perubahan data, hanya fokus pada tampilan

Contoh:
```

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halo Alterra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Halo Alterra'),
    );
  }
}
```

---
### Statefull widget
Mementingkan pada perubahan data, 1 widget menggunakan 2 class (widget dan state), perubahan data di statefull widget dapat dideteksi saat melakukan setstate dan tampilan akan di update sesuai dengan data yang berubah.

Contoh:
```

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nilai',
            ),
            Text(
              '${counter}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
```

---
### Built in widget
Widget widget yang dapat langsung digunakan, sudah terinstall bersama flutter
Contoh: MaterialApp, Scaffold, AppBar, Text dll

Cohtoh appbar, icon button dan text:
```
AppBar(
  title: Text('My App'),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        // kode atau function yang akan dijalankan
      },
    ),
  ],
)
```
