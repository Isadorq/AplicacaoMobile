import 'package:flutter/material.dart';
import '../checkout/checkout.dart';

class CarrinhoProvider with ChangeNotifier {
  final List<Reserva> _reservas = [];

  List<Reserva> get reservas => _reservas;

  void adicionarReserva(Reserva reserva) {
    _reservas.add(reserva);
    notifyListeners();
  }

  void removerReserva(Reserva reserva) {
    _reservas.remove(reserva);
    notifyListeners();
  }

  double get totalGeral {
    double total = 0;
    for (var r in _reservas) {
      total += r.total;
    }
    return total;
  }

  void limparCarrinho() {
    _reservas.clear();
    notifyListeners();
  }
}
