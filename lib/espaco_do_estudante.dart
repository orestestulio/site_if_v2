import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Para abrir links externos

import 'estilos_visuais.dart';
// Importe aqui as novas classes que contêm o Drawer e o BottomNavigationBar
import 'menu_lateral.dart'; // <-- Contém MenuLateral e BarraInferior

class espaco_do_estudante extends StatelessWidget {
  const espaco_do_estudante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usa a cor secundária definida em estilos_visuais
      backgroundColor: estilos_visuais.temaSecundario,

      // Usa a appBar do estilos_visuais, passando o título
      appBar: estilos_visuais.barraSuperior("Espaço do Estudante"),

      // Drawer agora vem da classe separada (MenuLateral)
      drawer: const MenuLateral(),

      // Barra inferior agora vem da classe separada (BarraInferior)
      bottomNavigationBar: const BarraInferior(),

      // FAB (botão flutuante) permanece local ou pode ir para estilos_visuais
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: estilos_visuais.botaoFlutuante(
            () {
          // Exemplo de ação: navegar de volta à Home
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        Icons.home,
        'Meu Perfil',
      ),

      // Conteúdo principal (scroll)
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem de destaque no topo
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
                  // Sombra por cima da imagem
                  Container(color: Colors.black.withOpacity(0.3)),
                  // Título centralizado
                  const Center(
                    child: Text(
                      "Bem-vindo(a) ao Espaço do Estudante!",
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

            // Grid com botões coloridos (emojis)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  // Biblioteca
                  _buildMenuButton(
                    cor: Colors.green,
                    titulo: "Biblioteca",
                    subtitulo: "Consulta do acervo",
                    emoji: "📚",
                    onTap: () =>
                        _abrirLink("https://www.ifsul.edu.br/bibliotecas"),
                  ),

                  // Estágios (sem link específico, se tiver: substitua aqui)
                  _buildMenuButton(
                    cor: Colors.orange,
                    titulo: "Estágios",
                    subtitulo: "Documentos e Info",
                    emoji: "🗂",
                    onTap: () {},
                  ),

                  // Portal EAD
                  _buildMenuButton(
                    cor: Colors.yellow[700] ?? Colors.yellow,
                    titulo: "Portal EAD",
                    subtitulo: "Ensino a Distância",
                    emoji: "💻",
                    onTap: () => _abrirLink("http://ead.ifsul.edu.br/"),
                  ),

                  // Bolsas (sem link específico)
                  _buildMenuButton(
                    cor: Colors.blue,
                    titulo: "Bolsas",
                    subtitulo: "Informações",
                    emoji: "💰",
                    onTap: () {},
                  ),

                  // Assistência (sem link específico)
                  _buildMenuButton(
                    cor: Colors.purple,
                    titulo: "Assistência",
                    subtitulo: "Estudantil",
                    emoji: "🤝",
                    onTap: () {},
                  ),

                  // Calendários
                  _buildMenuButton(
                    cor: Colors.green[800] ?? Colors.green,
                    titulo: "Calendários",
                    subtitulo: "Acadêmicos",
                    emoji: "📅",
                    onTap: () => _abrirLink(
                      "http://www.camaqua.ifsul.edu.br/lnk-estudante-calendario",
                    ),
                  ),

                  // Moodle
                  _buildMenuButton(
                    cor: Colors.deepOrange,
                    titulo: "Moodle",
                    subtitulo: "Acesso ao sistema",
                    emoji: "🌐",
                    onTap: () => _abrirLink("https://apnp.ifsul.edu.br/"),
                  ),

                  // SUAP - EDU
                  _buildMenuButton(
                    cor: Colors.lightGreen,
                    titulo: "SUAP - EDU",
                    subtitulo: "Acesso ao sistema",
                    emoji: "🔐",
                    onTap: () => _abrirLink(
                      "https://suap.ifsul.edu.br/accounts/login/?next=/",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Lista de links: Perguntas Frequentes, SISU, Ações Inclusivas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  _buildLinkTile(
                    titulo: "Perguntas Frequentes",
                    onTap: () {},
                  ),
                  _buildLinkTile(
                    titulo: "SISU",
                    onTap: () {},
                  ),
                  _buildLinkTile(
                    titulo: "Ações Inclusivas",
                    onTap: () {},
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

  //=== Função para abrir link usando url_launcher ===
  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir: $url';
    }
  }

  //=== Botão colorido com emoji (para o Grid)
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
                fontSize: 16,
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

  //=== ListTile simples (para links no final)
  Widget _buildLinkTile({
    required String titulo,
    required VoidCallback onTap,
  }) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: Text(titulo),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
