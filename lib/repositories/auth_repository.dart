import 'package:you_app_test/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthenticationRepository {
  final http.Client httpClient;

  AuthenticationRepository({required this.httpClient});

  Future<bool> hasToken() async {
    // Implement token check logic
    return false;
  }

  Future<void> persistToken(String token) async {
    // Implement token persistence logic
  }

  Future<void> deleteToken() async {
    // Implement token deletion logic
  }

  Future<User> getUser() async {
    // Implement get user logic
    final response = await httpClient.get(Uri.parse('http://techtest.youapp.ai/api/profile'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> logout() async {
    // Implement logout logic
    await deleteToken();
  }

  Future<User> authenticate({required String email, required String password}) async {
    final response = await httpClient.post(
      Uri.parse('http://techtest.youapp.ai/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await persistToken(responseBody['token']);
      return User.fromJson(responseBody['user']);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> register({required String name, required String email, required String password}) async {
    final response = await httpClient.post(
      Uri.parse('http://techtest.youapp.ai/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register');
    }
  }
}
