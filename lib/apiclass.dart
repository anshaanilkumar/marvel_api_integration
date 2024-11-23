import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Marlist.dart';

class ApiService {
  static const String _baseUrl = "https://www.simplifiedcoding.net/demos/marvel/";
  static Future<List<Marlist>> fetchMarlist() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Marlist.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
