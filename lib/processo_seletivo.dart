import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'estilos_visuais.dart';
import 'menu_lateral.dart';

class processo_seletivo extends StatelessWidget {
  const processo_seletivo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,
      appBar: estilos_visuais.barraSuperior("Processo Seletivo"),
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
        child: Column(
          children: [
            // Grande imagem no topo
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagem de fundo
                  Image.asset(
                    "assets/images/processo_seletivo_banner.png",
                    fit: BoxFit.cover,
                  ),
                  const Center(
                    child: Text(
                      " ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Grid com os blocos (Vestibular, SISU, etc.)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildMenuButton(
                    cor: Colors.red,
                    titulo: "Vestibular",
                    subtitulo: "Inscrições Abertas",
                    emoji: "🎓",
                    onTap: () => _abrirLink("https://www.ifsul.edu.br/vestibular"),
                  ),
                  _buildMenuButton(
                    cor: Colors.grey,
                    titulo: "SISU",
                    subtitulo: "Informações e Documentos",
                    emoji: "ℹ️",
                    onTap: () => _abrirLink("https://www.ifsul.edu.br/sisu"),
                  ),
                  _buildMenuButton(
                    cor: Colors.teal,
                    titulo: "Processos Anteriores",
                    subtitulo: "Consulte",
                    emoji: "📂",
                    onTap: () => _abrirLink("https://www.ifsul.edu.br/processos-anteriores"),
                  ),
                  _buildMenuButton(
                    cor: Colors.orange,
                    titulo: "Cursos Superiores",
                    subtitulo: "Vagas Remanescentes",
                    emoji: "🏛️",
                    onTap: () => _abrirLink("https://www.ifsul.edu.br/cursos-superiores"),
                  ),
                  _buildMenuButton(
                    cor: Colors.deepOrange,
                    titulo: "Seleção Complementar",
                    subtitulo: "",
                    emoji: "📝",
                    onTap: () {
                    },
                  ),
                  _buildMenuButton(
                    cor: Colors.purple,
                    titulo: "Notícias",
                    subtitulo: "",
                    emoji: "📰",
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              color: Colors.cyan[100],
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.cyan,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Recurso de Heteroidentificação - Ingresso no IFSul",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _abrirLink("https://www.youtube.com/watch?v=2hlLqPuPD3s"),
                    child: Container(
                      color: Colors.black,
                      child: Image.asset(
                        "assets/images/youtube_placeholder.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Onde posso saber mais sobre o tema?\n\n"
                        "Legislação: Lei 12.711/2012 (Lei de Cotas), Lei 14.723/23 e demais normas que regulamentam o tema.\n"
                        "Visite : IFSul Inclusivo\n\n"
                        "Cursos online e gratuitos ofertados pelo IFSul sobre a temática racial:\n"
                        "Plataforma Mundi\n"
                        "Curso sobre cotas raciais e heteroidentificação\n",
                    style: TextStyle(fontSize: 14),
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

  // Função para abrir links
  Future<void> _abrirLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir: $url';
    }
  }

  /// Cria cada bloco no grid
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
              style: const TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (subtitulo.isNotEmpty)
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
