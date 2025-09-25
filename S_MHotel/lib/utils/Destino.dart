import 'package:flutter/material.dart';
import 'package:projeto_mobile/carrinho/carrinho_provider.dart';
import 'package:provider/provider.dart';
import '../checkout/checkout.dart';

class Destino extends StatefulWidget {
  final String nome;
  final String img;
  final int valord;
  final int valorp;

  const Destino(this.nome, this.img, this.valord, this.valorp, {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_diarias = 0;
  int n_pessoas = 0;
  int total = 0;

  void incrementarDias() => setState(() => n_diarias++);
  void incrementarPessoas() => setState(() => n_pessoas++);
  void calcularTotal() => setState(() => total = (n_diarias * widget.valord) + (n_pessoas * widget.valorp));
  void limpar() => setState(() { n_diarias = 0; n_pessoas = 0; total = 0; });

  void checkout() {
    final reserva = Reserva(
      nome: widget.nome,
      valord: widget.valord,
      valorp: widget.valorp,
      nDiarias: n_diarias,
      nPessoas: n_pessoas,
      total: total,
      imagem: widget.img,
    );

    Provider.of<CarrinhoProvider>(context, listen: false).adicionarReserva(reserva);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Destino adicionado ao carrinho! 💜')),
    );

    limpar();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(4, 6),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(widget.img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 8, color: Colors.black)],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dias de hospedagem: $n_diarias", style: const TextStyle(color: Colors.white, fontSize: 16)),
                Text("Número de acompanhantes: $n_pessoas", style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: [
                    ElevatedButton.icon(
                      onPressed: incrementarDias,
                      icon: const Icon(Icons.looks_one, size: 20),
                      label: const Text("Dias"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: incrementarPessoas,
                      icon: const Icon(Icons.looks_two, size: 20),
                      label: const Text("Pessoas"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: calcularTotal,
                      icon: const Icon(Icons.calculate, size: 20),
                      label: const Text("Calcular"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: limpar,
                      icon: const Icon(Icons.clear, size: 20),
                      label: const Text("Limpar"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: checkout,
                      icon: const Icon(Icons.shopping_cart, size: 20),
                      label: const Text("Checkout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[700],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Total: R\$ $total",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
