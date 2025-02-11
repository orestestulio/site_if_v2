import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'login_state.dart';
import 'estilos_visuais.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _dbHelper = DatabaseHelper();
  final _nomeController = TextEditingController();

  Future<void> _fazerLogin() async {
    final nome = _nomeController.text.trim();
    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe um nome!')),
      );
      return;
    }

    final user = await _dbHelper.getUserByName(nome);
    if (user != null) {
      // Achou o usuário, loga
      LoginState.currentUser = user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bem-vindo, ${user['nome']}!')),
      );
      Navigator.pop(context); // Volta para a tela anterior
    } else {
      // Não achou
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário não encontrado!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,

      appBar: estilos_visuais.barraSuperior("Fazer Login"),

      // Corpo com scroll
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
                  // Imagem de fundo
                  Image.asset(
                    "assets/images/library_woman.png",
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black26),
                ],
              ),
            ),

            // Espaço após banner
            const SizedBox(height: 16),

            // Formulário de login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),

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
                      onPressed: _fazerLogin,
                      child: const Text(
                        'Login',
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
