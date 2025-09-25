import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController senhaCtrl = TextEditingController();
  bool isLoading = false;

  Future<void> enviarRegistro() async {
    setState(() => isLoading = true);

    final resposta = await http.post(
      Uri.parse('http://10.109.83.4:3000/usuarios'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nome": nomeCtrl.text,
        "email": emailCtrl.text,
        "senha": senhaCtrl.text,
      }),
    );

    if (resposta.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário registrado com sucesso! 🌟')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao registrar usuário 😢')),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_add_alt_1, size: 100, color: Colors.purple),
              const SizedBox(height: 16),
              const Text(
                "Registro",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 36),
              TextField(
                controller: nomeCtrl,
                decoration: InputDecoration(
                  labelText: 'Seu nome',
                  prefixIcon: const Icon(Icons.badge),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Seu email',
                  prefixIcon: const Icon(Icons.alternate_email),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: senhaCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha secreta',
                  prefixIcon: const Icon(Icons.vpn_key),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(height: 28),
              isLoading
                  ? const CircularProgressIndicator(color: Colors.purple)
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: enviarRegistro,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text('Registrar', style: TextStyle(fontSize: 18)),
                      ),
                    ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Já tem conta? "),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
