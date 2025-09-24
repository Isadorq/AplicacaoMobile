import 'package:flutter/material.dart';

class Carrinho extends ChangeNotifier {
  int total = 0;

  void atualizarTotal(int valor) {
    total = valor;
    notifyListeners();
  }

  void limpar() {
    total = 0;
    notifyListeners();
  }
}
