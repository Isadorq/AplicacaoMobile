import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/destino.dart';
import '../../data/hotel_data.dart';
import '../../model/carrinho.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Carrinho(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text(
            "S&M Hotel",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[700],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (context, index) {
              final hotel = hotels[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Destino(
                  nome: hotel.nome,
                  imagem: hotel.imagem,
                  valord: hotel.valord,
                  valorp: hotel.valorp,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
