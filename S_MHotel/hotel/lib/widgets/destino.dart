import 'package:flutter/material.dart';

class Destino extends StatefulWidget {
  final String nome;
  final String imagem;
  final int valord;
  final int valorp;

  Destino({
    required this.nome,
    required this.imagem,
    required this.valord,
    required this.valorp,
  });

  @override
  _DestinoState createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int nDiarias = 0;
  int nPessoas = 0;
  int total = 0;

  void incrementDias() => setState(() => nDiarias++);
  void incrementPessoas() => setState(() => nPessoas++);
  void calcularTotal() => setState(() {
        total = (nDiarias * widget.valord) + (nPessoas * widget.valorp);
      });
  void limparCampos() => setState(() {
        nDiarias = 0;
        nPessoas = 0;
        total = 0;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                widget.imagem,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Diária: R\$${widget.valord} - Pessoa: R\$${widget.valorp}",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: incrementDias,
                        icon: Icon(Icons.add),
                        label: Text("Dias: $nDiarias"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[400],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: incrementPessoas,
                        icon: Icon(Icons.person_add),
                        label: Text("Pessoas: $nPessoas"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[400],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: calcularTotal,
                        child: Text("Calcular"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[400],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: limparCampos,
                        child: Text("Limpar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Total: R\$ $total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
