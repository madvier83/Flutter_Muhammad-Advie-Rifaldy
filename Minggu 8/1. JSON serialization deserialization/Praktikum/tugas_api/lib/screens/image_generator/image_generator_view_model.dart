import 'package:flutter/material.dart';
import 'package:tugas_api/models/api/image_generator_api.dart';

class ImageGeneratorViewModel extends ChangeNotifier {
  String _avatar = "";
  String get avatar => _avatar;

  final TextEditingController _seedController = TextEditingController();
  TextEditingController get seedController => _seedController;

  final api = ImageGeneratorApi();

  Future<void> getAvatar({String? seed}) async {
    _avatar = await api.getAvatar(seed: seed);
    notifyListeners();
  }
}