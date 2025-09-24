// import 'package:flutter/material.dart';
// // import 'package:hotel/ui/login/login.dart';

// void main() {
//   runApp(const HotelApp());
// }

// class HotelApp extends StatelessWidget {
//   const HotelApp({super.key});

//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: 'S&M Hotel',
//   //     theme: ThemeData(primarySwatch: Colors.blue),
//   //     home: const LoginScreen(),
//   //   );
//   // }
// }

import 'package:flutter/material.dart';
import 'ui/homescreen/home.dart'; // ajusta o caminho se necessário

void main() {
  runApp(const HotelApp());
}

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S&M Hotel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Home(), // chama direto a home com os destinos
    );
  }
}
