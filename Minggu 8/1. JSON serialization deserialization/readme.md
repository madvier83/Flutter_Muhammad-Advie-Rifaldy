# REST API - JSON Serialization/Deserialization

## Dio
Instalasi dio ke pubspec yaml
```
dependencies:
  flutter:
    sdk: flutter
  dio: ^4.0.0
```

buat instansi dio
```
final dio = Dio();
```

contoh GET request
```
Future<void> fetchData() async {
  try {
    final response = await dio.get('https:...   ');

    if (response.statusCode == 200) {
      // Handle successful response.
      final data = response.data;
      print('Response data: $data');
    } else {
      // Handle error response.
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors.
    print('Dio error: $e');
  }
}
```

contoh POST request tanpa try catch handler
```
class PostApi {
  final Dio dio = Dio();

  Future<String?> putPost({required PostModel data}) async {
    String url = "https://jsonplaceholder.typicode.com/posts/1";
    final response = await dio.put(url, data: data.toMap());
    return response.toString();
  }
}
```
