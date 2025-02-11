import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'estilos_visuais.dart';
import 'menu_lateral.dart';

class telefones extends StatelessWidget {
  const telefones({Key? key}) : super(key: key);

  /// Método auxiliar para abrir o discador.
  Future<void> _abrirTelefone(String numero) async {
    final apenasDigitos = numero.replaceAll(RegExp(r'[^0-9]'), '');
    final uri = Uri.parse("tel:$apenasDigitos");

    if (!await launchUrl(uri)) {
      throw 'Não foi possível discar para: $numero';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> setores = [
      {
        'setor': 'Recepção',
        'telefone': '2170 0400',
      },
      {
        'setor': 'Gabinete da Direção-geral',
        'telefone': 'Solicitar transferência para o setor desejado',
      },
      {
        'setor': 'Departamento de Ensino, Pesquisa e Extensão - DEPEX',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Registros Acadêmicos - CORAC',
        'telefone': '',
      },
      {
        'setor': 'Setor de Gestão de Pessoas - GP',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Extensão e Cultura - COEXC',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Formação Geral e Apoio ao Ensino - COAEN',
        'telefone': '',
      },
      {
        'setor': 'Supervisão Escolar/Pedagoga/ Téc. Assuntos Educacionais',
        'telefone': '',
      },
      {
        'setor': 'Enfermaria',
        'telefone': '',
      },
      {
        'setor': 'Assistente Social',
        'telefone': '',
      },
      {
        'setor': 'Departamento de Administração e Planejamento - DEAP',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Gestão de Contratos - COGEC',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Licitações e Compras - COLIC',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Orçamento, Contabilidade e Finanças - COCAF',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Manutenção Geral - COMAG',
        'telefone': '',
      },
      {
        'setor': 'Coord. de Tecnologia da Informação - COTIN',
        'telefone': '',
      },
      {
        'setor': 'Guarita',
        'telefone': '',
      },
      {
        'setor': 'Quadra de Esportes',
        'telefone': '',
      },
    ];

    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,
      appBar: estilos_visuais.barraSuperior("Telefones / Ramais"),
      drawer: const MenuLateral(),
      bottomNavigationBar: const BarraInferior(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: estilos_visuais.botaoFlutuante(
            () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        Icons.home,
        'Página Inicial',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: DataTable(
            headingRowColor: WidgetStateColor.resolveWith((states) => estilos_visuais.temaPrincipal),
            headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            dataRowHeight: 60,
            columnSpacing: 10,
            columns: const [
              DataColumn(label: Text('Setor')),
              DataColumn(label: Text('Telefone / Ramal')),
            ],
            rows: setores.map((setorInfo) {
              final setor = setorInfo['setor'] ?? '';
              final telefone = setorInfo['telefone'] ?? '';

              return DataRow(
                cells: [
                  DataCell(
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(
                        setor,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  DataCell(
                    (telefone.isNotEmpty && !telefone.toLowerCase().contains('solicitar'))
                        ? InkWell(
                      onTap: () => _abrirTelefone(telefone),
                      child: Text(
                        telefone,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                        : Text(telefone.isEmpty ? 'N/A' : telefone),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
