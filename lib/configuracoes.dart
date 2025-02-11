import 'package:flutter/material.dart';
import 'menu_lateral.dart';
import 'estilos_visuais.dart';
import 'login_state.dart';

import 'login.dart';
import 'cadastro.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  void _logout() {
    setState(() {
      LoginState.currentUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = LoginState.currentUser;

    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,
      appBar: estilos_visuais.barraSuperior("Configurações"),
      drawer: const MenuLateral(),
      bottomNavigationBar: const BarraInferior(),

      // Define a posição do FAB (no centro, encaixado na barra inferior)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Cria o botão usando a função do estilos_visuais
      floatingActionButton: estilos_visuais.botaoFlutuante(
            () {
          // Ao clicar, volta para a página inicial
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        Icons.home,
        'Página Inicial',
      ),

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
                    "assets/images/library_woman.png",
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black26),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: user == null ? _buildLoggedOut() : _buildLoggedIn(user),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggedOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Você não está logado. Escolha uma opção:",
          style: TextStyle(
            fontSize: 16,
            color: estilos_visuais.temaPrincipal,
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          width: 220,
          child: ElevatedButton(
            style: _buttonStyle(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              ).then((_) => setState(() {}));
            },
            child: const Text('Fazer Login', style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: 220,
          child: ElevatedButton(
            style: _buttonStyle(outlined: true),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CadastroPage()),
              ).then((_) => setState(() {}));
            },
            child: const Text('Cadastrar Novo Usuário', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  Widget _buildLoggedIn(Map<String, dynamic> user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Bem-vindo(a), ${user['nome']}!",
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          "Seu curso: ${user['curso']}",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 24),

        SizedBox(
          width: 220,
          child: ElevatedButton(
            style: _buttonStyle(),
            onPressed: _logout,
            child: const Text('Logout', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  ButtonStyle _buttonStyle({bool outlined = false}) {
    if (!outlined) {
      return ElevatedButton.styleFrom(
        backgroundColor: estilos_visuais.temaPrincipal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
    } else {
      return ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: estilos_visuais.temaPrincipal,
        side: BorderSide(color: estilos_visuais.temaPrincipal, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      );
    }
  }
}
