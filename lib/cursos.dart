import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'estilos_visuais.dart';
import 'menu_lateral.dart';

class cursos extends StatelessWidget {
  const cursos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,
      appBar: estilos_visuais.barraSuperior("Cursos"),
      drawer: const MenuLateral(),
      bottomNavigationBar: const BarraInferior(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: estilos_visuais.botaoFlutuante(
            () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        Icons.home,
        'Meu Perfil',
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 3.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildCourseItem(
                imagePath: "assets/images/cursos/automacao.png",
                onTap: () => _abrirLink("http://www.camaqua.ifsul.edu.br/tecnico-em-automacao-industrial"),
              ),
              _buildCourseItem(
                imagePath: "assets/images/cursos/ambiental.png",
                onTap: () => _abrirLink("http://www.camaqua.ifsul.edu.br/tecnico-em-controle-ambiental"),
              ),
              _buildCourseItem(
                imagePath: "assets/images/cursos/informatica.png",
                onTap: () => _abrirLink("http://www.camaqua.ifsul.edu.br/tecnico-em-informatica"),
              ),
              _buildCourseItem(
                imagePath: "assets/images/cursos/eletrotecnica.png",
                onTap: () => _abrirLink("http://www.camaqua.ifsul.edu.br/tecnico-em-eletrotecnica"),
              ),
              _buildCourseItem(
                imagePath: "assets/images/cursos/analise_desenvolvimento.png",
                onTap: () => _abrirLink("http://www.camaqua.ifsul.edu.br/tecnologia-em-analise-e-desenvolvimento-de-sistemas"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Função para abrir links no navegador
  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir: $url';
    }
  }

  /// Cria o item do grid com a imagem
  Widget _buildCourseItem({
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
            fit: BoxFit.contain, // exibe sem cortar
          ),
        ),
      ),
    );
  }
}
