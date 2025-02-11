import 'package:flutter/material.dart';
import 'processo_seletivo.dart';
import 'espaco_do_estudante.dart';
import 'espaco_do_servidor.dart';
import 'estilos_visuais.dart';
import 'menu_lateral.dart';
import 'projetos_de_extensao.dart';

void main() {
  runApp(const MinhaAplicacao());
}

class MinhaAplicacao extends StatelessWidget {
  const MinhaAplicacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

/// Página inicial do aplicativo
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cores do app
      backgroundColor: estilos_visuais.temaSecundario,
      appBar: estilos_visuais.barraSuperior("IFSul Campus Camaquã"),

      // Menu lateral
      drawer: const MenuLateral(),
      // Barra inferior
      bottomNavigationBar: const BarraInferior(),

      // Botão flutuante
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: estilos_visuais.botaoFlutuante(
            () {},
        Icons.home,
        'Meu Perfil',
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 117,
              child: SliderDeImagens(),
            ),

            // Logo
            Container(
              width: double.infinity,
              child: Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.fitWidth,
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 3.2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Projetos de Extensão
                  _buildBannerItem(
                    imagePath: "assets/images/cursos/extensao.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const projetos_de_extensao()),
                      );
                    },
                  ),

                  // Projetos de Pesquisa
                  _buildBannerItem(
                    imagePath: "assets/images/cursos/pesquisa.png",
                    onTap: () {
                      //
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Cria cada “banner” (imagem de fundo) clicável
  Widget _buildBannerItem({
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

/// Slider com PageView, como já existia
class SliderDeImagens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Image.asset(
          'assets/images/image1.jpg',
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/image2.jpg',
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
