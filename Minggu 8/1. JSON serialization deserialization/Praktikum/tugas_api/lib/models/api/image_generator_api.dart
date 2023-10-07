import 'package:dio/dio.dart';

class ImageGeneratorApi {
  final dio = Dio();

  Future<String> getAvatar({String? seed}) async {
    final response = await dio.get(
        'https://api.dicebear.com/7.x/bottts-neutral/svg?seed=${seed != "" ? seed : "rand"}');

    if (response.statusCode == 200) {
      // print(response.data.toString());
      return response.data.toString();
    } else {
      throw Exception('Failed to load DiceBear avatar');
    }
  }
}
