import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'estilos_visuais.dart';

// Import das outras telas
import 'espaco_do_estudante.dart';
import 'processo_seletivo.dart';
import 'espaco_do_servidor.dart';
import 'cursos.dart';
import 'configuracoes.dart';
import 'ouvidoria.dart';
import 'telefones.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  // Método auxiliar para abrir links externos
  Future<void> _abrirLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: estilos_visuais.temaPrincipal,
            ),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // Espaço do Estudante
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Espaço do Estudante'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => espaco_do_estudante()),
              );
            },
          ),

          // Espaço do Servidor
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Espaço do Servidor'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => espaco_do_servidor()),
              );
            },
          ),

          // Processo Seletivo
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Processo Seletivo'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => processo_seletivo()),
              );
            },
          ),

          // Cursos
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Cursos'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => cursos()),
              );
            },
          ),

          // Editais
          ListTile(
            leading: const Icon(Icons.bookmark_border_outlined),
            title: const Text('Editais'),
            onTap: () async {
              Navigator.pop(context);
              await _abrirLink("https://editais.ifsul.edu.br/index.php?c=lista&id=105");
            },
          ),

          // Concursos
          ListTile(
            leading: const Icon(Icons.how_to_reg),
            title: const Text('Concursos'),
            onTap: () async {
              Navigator.pop(context);
              await _abrirLink("https://concursos.ifsul.edu.br/");
            },
          ),

          // Notícias
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('Notícias'),
            onTap: () async {
              Navigator.pop(context);
              await _abrirLink("http://www.camaqua.ifsul.edu.br/ultimas-noticias");
            },
          ),

          // Ouvidoria (re-adicionado)
          ListTile(
            leading: const Icon(Icons.record_voice_over),
            title: const Text('Ouvidoria'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ouvidoria()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Telefones'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const telefones()),
              );
            },
          )
        ],
      ),
    );
  }
}

class BarraInferior extends StatelessWidget {
  const BarraInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Mensagens',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configurações',
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Configuracoes()),
          );
        }
      },
    );
  }
}
