import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'login_state.dart';
import 'estilos_visuais.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _dbHelper = DatabaseHelper();
  final _nomeController = TextEditingController();
  String _cursoSelecionado = 'Automação Industrial';

  final List<String> _listaCursos = [
    'Automação Industrial',
    'Controle Ambiental',
    'Informática',
    'Eletrotécnica',
    'Análise e Desenv. de Sistemas',
  ];

  Future<void> _cadastrar() async {
    final nome = _nomeController.text.trim();
    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe um nome!')),
      );
      return;
    }

    // Cria o usuário no banco
    final id = await _dbHelper.createUser(nome, _cursoSelecionado);

    // Se deu certo, recupera o usuário criado e salva em LoginState
    if (id > 0) {
      final user = {
        'id': id,
        'nome': nome,
        'curso': _cursoSelecionado,
      };
      LoginState.currentUser = user;

      // Exibe mensagem e volta para a tela anterior
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro concluído e login efetuado!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falha ao cadastrar usuário!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,

      appBar: estilos_visuais.barraSuperior("Cadastrar Novo Usuário"),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner no topo
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/library_woman.png", // Ajuste para outro banner, se quiser
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black26),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Formulário
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Campo Nome
                  TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Dropdown do Curso
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      value: _cursoSelecionado,
                      isExpanded: true,
                      underline: const SizedBox(), // remove sublinhado
                      items: _listaCursos.map((curso) {
                        return DropdownMenuItem<String>(
                          value: curso,
                          child: Text(curso),
                        );
                      }).toList(),
                      onChanged: (valor) {
                        setState(() {
                          _cursoSelecionado = valor ?? _cursoSelecionado;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botão Cadastrar
                  SizedBox(
                    width: 220,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: estilos_visuais.temaPrincipal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _cadastrar,
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
