import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'localhost:3000';

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/usuario?email=$email&password=$password');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.isNotEmpty; // true se achou o usuário
    } else {
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/usuario');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    return response.statusCode == 201;
  }
}
