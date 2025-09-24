// import 'package:flutter/material.dart';
// import 'package:hotel/ui/register/register.dart';
// import 'package:hotel/ui/homescreen/home.dart';
// import 'package:hotel/services/api_service.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final ApiService api = ApiService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("S&M Hotel - Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(labelText: "Senha"),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 final success = await api.login(
//                   emailController.text.trim(),
//                   passwordController.text.trim(),
//                 );

//                 if (success) {
//                   if (context.mounted) {
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
//                   }
//                 } else {
//                   if (context.mounted) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text("Email ou senha inválidos"),
//                       ),
//                     );
//                   }
//                 }
//               },
//               child: const Text("Entrar"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const RegisterScreen(),
//                   ),
//                 );
//               },
//               child: const Text("Cadastre-se"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
