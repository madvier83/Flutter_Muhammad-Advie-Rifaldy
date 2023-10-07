import 'package:dio/dio.dart';
import 'package:tugas_api/models/post_model.dart';

class PostApi {
  final Dio dio = Dio();

  Future<String?> putPost({required PostModel data}) async {
    String url = "https://jsonplaceholder.typicode.com/posts/1";
    final response = await dio.put(url, data: data.toMap());
    return response.toString();
  }
}
