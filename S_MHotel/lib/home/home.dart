import 'package:flutter/material.dart';
import 'package:projeto_mobile/carrinho/carrinho.dart';
import 'package:projeto_mobile/utils/Destino.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "S&M Hotel - Destinos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CarrinhoScreen()),
              );
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          Destino("Angra dos Reis", "imagens/angra.jpg", 384, 70),
          Destino("Arraial do Cabo", "imagens/arraial.jpg", 534, 65),
          Destino("Florianópolis", "imagens/floripa.jpg", 348, 85),
          Destino("Jericoacoara", "imagens/jericoara.jpeg", 571, 75),
          Destino("Chile", "imagens/chile.jpg", 446, 95),
          Destino("Madri", "imagens/madri.jpg", 401, 85),
          Destino("Paris", "imagens/paris.jpg", 546, 95),
          Destino("Roma", "imagens/roma.jpg", 478, 85),
          Destino("Orlando", "imagens/orlando.jpeg", 616, 105),
          Destino("Las Vegas", "imagens/lasvegas.jpg", 504, 110),
        ],
      ),
    );
  }
}
