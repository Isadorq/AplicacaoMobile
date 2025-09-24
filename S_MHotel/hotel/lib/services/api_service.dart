import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:63808';

  Future<bool> login(String email, String password) async {
    final response = await http.get(Uri.parse('$baseUrl/usuario?email=$email&password=$password'));
    final data = jsonDecode(response.body);
    return data.isNotEmpty;
  }

  Future<bool> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cadastro-usuario'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );
    return response.statusCode == 201;
  }
}
