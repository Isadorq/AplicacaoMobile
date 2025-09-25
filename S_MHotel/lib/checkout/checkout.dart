import 'package:flutter/material.dart';

class Reserva {
  final String nome;
  final String imagem;
  final int valord;
  final int valorp;
  final int nDiarias;
  final int nPessoas;
  final int total;

  Reserva({
    required this.nome,
    required this.valord,
    required this.valorp,
    required this.nDiarias,
    required this.nPessoas,
    required this.total,
    required this.imagem,
  });
}

class CheckoutScreen extends StatefulWidget {
  final Reserva reserva;
  const CheckoutScreen({super.key, required this.reserva});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String formaPagamento = 'Cartão';
  double valorFinal = 0;

  @override
  void initState() {
    super.initState();
    valorFinal = widget.reserva.total.toDouble();
  }

  void aplicarDesconto() {
    setState(() {
      if (formaPagamento == 'PIX') {
        valorFinal = widget.reserva.total * 0.9;
      } else {
        valorFinal = widget.reserva.total.toDouble();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Destino: ${widget.reserva.nome}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12),
            Text("Dias de hospedagem: ${widget.reserva.nDiarias}"),
            Text("Número de acompanhantes: ${widget.reserva.nPessoas}"),
            Text("Valor diário: R\$ ${widget.reserva.valord}"),
            Text("Valor por pessoa: R\$ ${widget.reserva.valorp}"),
            const SizedBox(height: 20),
            const Text(
              "Escolha a forma de pagamento:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: formaPagamento,
                isExpanded: true,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'Cartão', child: Text('Cartão')),
                  DropdownMenuItem(value: 'PIX', child: Text('PIX (10% de desconto)')),
                  DropdownMenuItem(value: 'Boleto', child: Text('Boleto')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    formaPagamento = value;
                    aplicarDesconto();
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Total da viagem: R\$ ${valorFinal.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Pagamento realizado!"),
                        content: Text(
                          "Destino: ${widget.reserva.nome}\nTotal pago: R\$ ${valorFinal.toStringAsFixed(2)}\nForma de pagamento: $formaPagamento",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Confirmar Pagamento",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
