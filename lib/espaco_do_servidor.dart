import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Se for abrir links externos
import 'estilos_visuais.dart'; // Onde define temaPrincipal/temaSecundario e barraSuperior
import 'menu_lateral.dart';    // Onde estão MenuLateral e BarraInferior

class espaco_do_servidor extends StatelessWidget {
  const espaco_do_servidor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo com a cor definida em estilos_visuais
      backgroundColor: estilos_visuais.temaSecundario,

      // Barra superior
      appBar: estilos_visuais.barraSuperior('Espaço do Servidor'),

      // Drawer e barra inferior vêm do menu_lateral.dart
      drawer: const MenuLateral(),
      bottomNavigationBar: const BarraInferior(),

      // FAB (opcional)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: estilos_visuais.botaoFlutuante(
            () {
          // Exemplo: voltar à Home
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        Icons.home,
        'Meu Perfil',
      ),

      // Corpo da tela
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem grande no topo
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagem de fundo
                  Image.asset(
                    "assets/images/servidor_people.png", // Ajuste o nome/path
                    fit: BoxFit.cover,
                  ),
                  // Sombra
                  Container(color: Colors.black.withOpacity(0.3)),
                  // Título central
                  const Center(
                    child: Text(
                      "Bem-vindo(a) ao Espaço do Servidor!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Grid com botões (2 colunas)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // 1) Webmail
                  _buildMenuButton(
                    cor: Colors.red,
                    titulo: "Webmail",
                    subtitulo: "E-mail institucional",
                    emoji: "✉️",
                    onTap: () => _abrirLink("https://webmail.ifsul.edu.br/"),
                  ),
                  // 2) Intranet
                  _buildMenuButton(
                    cor: Colors.lightGreen,
                    titulo: "Intranet",
                    subtitulo: "Acesso restrito",
                    emoji: "ℹ️",
                    onTap: () {
                      // Ajuste o link real, se houver
                      _abrirLink("https://intranet.ifsul.edu.br");
                    },
                  ),
                  // 3) SIGEPE
                  _buildMenuButton(
                    cor: Colors.blueGrey,
                    titulo: "SIGEPE",
                    subtitulo: "Acesso ao sistema",
                    emoji: "🇧🇷",
                    onTap: () {
                      // Ajuste o link real
                      _abrirLink("https://sigepe.servidor.gov.br");
                    },
                  ),
                  // 4) SUAP
                  _buildMenuButton(
                    cor: Colors.blue,
                    titulo: "SUAP",
                    subtitulo: "Acesso ao sistema",
                    emoji: "🖱️",
                    onTap: () => _abrirLink("https://suap.ifsul.edu.br"),
                  ),
                  // 5) Q-Acadêmico
                  _buildMenuButton(
                    cor: Colors.pink,
                    titulo: "Q-acadêmico",
                    subtitulo: "Acesso ao sistema",
                    emoji: "📖",
                    onTap: () {
                      // Ajuste link
                      _abrirLink("https://qacademico.ifsul.edu.br");
                    },
                  ),
                  // 6) Calendários
                  _buildMenuButton(
                    cor: Colors.green,
                    titulo: "Calendários",
                    subtitulo: "Acadêmicos",
                    emoji: "📅",
                    onTap: () {
                      // Ajuste link
                      _abrirLink("http://www.camaqua.ifsul.edu.br/calendarios");
                    },
                  ),
                  // 7) Novo servidor
                  _buildMenuButton(
                    cor: Colors.yellow[800] ?? Colors.yellow,
                    titulo: "Novo servidor",
                    subtitulo: "Documentos e orientações",
                    emoji: "📂",
                    onTap: () {
                      // Ajuste link
                    },
                  ),
                  // 8) Aposentados
                  _buildMenuButton(
                    cor: Colors.cyan,
                    titulo: "Aposentados",
                    subtitulo: "e pensionistas",
                    emoji: "👴",
                    onTap: () {
                      // Ajuste link
                    },
                  ),
                  // 9) Biblioteca
                  _buildMenuButton(
                    cor: Colors.greenAccent[700] ?? Colors.greenAccent,
                    titulo: "Biblioteca",
                    subtitulo: "Consulta do acervo",
                    emoji: "📚",
                    onTap: () {
                      _abrirLink("https://www.ifsul.edu.br/bibliotecas");
                    },
                  ),
                  // 10) Gestão de Pessoas
                  _buildMenuButton(
                    cor: Colors.redAccent,
                    titulo: "GESTÃO",
                    subtitulo: "de Pessoas",
                    emoji: "👥",
                    onTap: () {
                      // Ajuste link
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

  // Abre link usando url_launcher
  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir: $url';
    }
  }

  // Mesmo padrão do espaco_do_estudante (Emoji, cor, etc.)
  Widget _buildMenuButton({
    required Color cor,
    required String titulo,
    required String subtitulo,
    required String emoji,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
