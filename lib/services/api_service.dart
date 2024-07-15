import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://techtest.youapp.ai/';

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(baseUrl + endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  // Add other API methods (GET, PUT, DELETE)
}
