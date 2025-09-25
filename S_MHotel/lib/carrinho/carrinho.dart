import 'package:flutter/material.dart';
import 'package:projeto_mobile/carrinho/carrinho_provider.dart';
import 'package:provider/provider.dart';
import '../checkout/checkout.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({super.key});

  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  String formaPagamento = 'cartao';

  double calcularTotalComDesconto(double total) {
    if (formaPagamento == 'pix') return total * 0.9;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: carrinho.reservas.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum destino adicionado.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: carrinho.reservas.length,
                    itemBuilder: (context, index) {
                      final r = carrinho.reservas[index];
                      return Card(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 3,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              r.imagem,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            r.nome,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text(
                              'Diárias: ${r.nDiarias}, Pessoas: ${r.nPessoas}\nTotal: R\$ ${r.total}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => carrinho.removerReserva(r),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Forma de pagamento: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: formaPagamento,
                      items: const [
                        DropdownMenuItem(
                          value: 'cartao',
                          child: Text('Cartão'),
                        ),
                        DropdownMenuItem(
                          value: 'pix',
                          child: Text('PIX (10% desconto)'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          formaPagamento = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: R\$ ${calcularTotalComDesconto(carrinho.totalGeral).toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: carrinho.reservas.isEmpty
                          ? null
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Pagamento realizado com sucesso!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              carrinho.limparCarrinho();
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
