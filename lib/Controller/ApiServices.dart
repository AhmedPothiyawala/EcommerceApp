import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/TaskModel.dart';

class ApiService {
  Future<DaoModel> fetchDataFromApi() async {
    final Uri url =
        Uri.parse('https://devlaundry.chplgroup.org/data_task.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return DaoModel.fromJson(json);
    } else {
      throw Exception(
          'Failed to fetch data. Status code: ${response.statusCode}');
    }
  }
}
