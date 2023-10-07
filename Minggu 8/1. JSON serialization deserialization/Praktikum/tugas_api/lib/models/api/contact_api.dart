import 'package:dio/dio.dart';
import 'package:tugas_api/models/contact_model.dart';

class ContactApi {
  final Dio dio = Dio();
  // GET CONTACT
  Future<List<ContactModel>> getContacts() async {
    try {
      String url =
          "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts";
      final response = await dio.get(url);
      // print(response.data[0]["name"]);
      if (response.statusCode == 200) {
        List<ContactModel> data = (response.data as List)
            .map((e) => ContactModel.fromMap(e))
            .toList();
        return data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<ContactModel>> getContactById({required String id}) async {
    try {
      String url =
          "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id";
      final response = await dio.get(url);
      // print(response.data[0]["name"]);
      if (response.statusCode == 200) {
        List<ContactModel> data = [ContactModel.fromMap(response.data)];
        return data;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // CREATE CONTACT
  Future<String> createContact({required ContactModel contact}) async {
    String url =
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts";
    var data = {
      "name": contact.name,
      "phone": contact.phone,
    };
    final response = await dio.post(
      url,
      data: data,
    );
    return response.toString();
  }
}
