import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _djangoBaseUrl = 'http://10.168.0.45:8000/api/';

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('${_djangoBaseUrl}login/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register({required String name, required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('${_djangoBaseUrl}register/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}),
      );
      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> fetchAddressByCep(String cep) async {
    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanCep.length != 8) {
      throw Exception('CEP inválido. Deve conter 8 dígitos.');
    }

    final response = await http.get(
      Uri.parse('https://viacep.com.br/ws/$cleanCep/json/'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.containsKey('erro') && data['erro'] == true) {
        throw Exception('CEP não encontrado.');
      }
      return data;
    } else {
      throw Exception('Falha ao buscar CEP.');
    }
  }
}
