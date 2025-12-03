import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = "http://192.168.0.15:8000"; 

  static Future<bool> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
      }),
    );

    return response.statusCode == 201 || response.statusCode == 200;
  }

  static Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body["access"]; 
    }

    return null;
  }
}
