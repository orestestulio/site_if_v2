import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'estilos_visuais.dart';
import 'menu_lateral.dart';

class ouvidoria extends StatelessWidget {
  const ouvidoria({Key? key}) : super(key: key);

  /// Método para abrir links no navegador ou app padrão.
  Future<void> _abrirLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir: $url';
    }
  }

  /// Abre o discador (telefone) ou WhatsApp (se usar link wa.me).
  Future<void> _abrirTelefone(String telefone) async {
    // Exemplo: "tel:53997029358" abre discador
    final uri = Uri.parse("tel:$telefone");
    if (!await launchUrl(uri)) {
      throw 'Não foi possível discar para: $telefone';
    }
  }

  /// Abre app de e-mail se usar "mailto:"
  Future<void> _abrirEmail(String email) async {
    final uri = Uri.parse("mailto:$email");
    if (!await launchUrl(uri)) {
      throw 'Não foi possível enviar e-mail para: $email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,
      appBar: estilos_visuais.barraSuperior("Ouvidoria"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Apresentação ---
            _buildTitle("Apresentação"),
            _buildParagraph(
              "A Ouvidoria é um serviço disponibilizado pelo Instituto Federal de Educação, Ciência e Tecnologia Sul-rio-grandense, "
                  "que tem por finalidade dar os devidos encaminhamentos, no âmbito institucional, a denúncias, reclamações, solicitações, "
                  "sugestões e elogios referentes aos serviços prestados pela Instituição.\n\n"
                  "Atualmente a Ouvidoria Institucional tem como responsável a servidora Veridiana Krolow Bosenbecker.",
            ),

            // Link para Currículo
            _buildParagraph("Currículo: "),
            _buildLinkLine(
              "http://lattes.cnpq.br/9025007677890059",
              "http://lattes.cnpq.br/9025007677890059",
            ),

            const SizedBox(height: 16),

            _buildParagraph(
                "Se você busca informações, o canal recomendado é o Fale Conosco.\n\n"
                    "Para registrar sua manifestação, acesse o Fala.BR."
            ),

            // Botão ou link para Fala.BR
            _buildLinkLine("Fala.BR", "https://falabr.cgu.gov.br/"),

            const SizedBox(height: 24),

            // --- Tipos de Manifestações ---
            _buildTitle("Tipos de Manifestações"),
            _buildParagraph(
                "SOLICITAÇÃO DE ACESSO À INFORMAÇÃO: solicitar informações públicas de órgãos ou entes do Poder Executivo Federal;\n\n"
                    "DENÚNCIA: comunicação de prática de ato ilícito cuja solução dependa da atuação de órgão de controle interno ou externo;\n\n"
                    "SUGESTÃO: proposição de ideia ou formulação de proposta de aprimoramento de políticas e serviços prestados pela Administração Pública federal;\n\n"
                    "ELOGIO: demonstração ou reconhecimento ou satisfação sobre o serviço oferecido ou atendimento recebido;\n\n"
                    "SOLICITAÇÃO: requerimento de adoção de providência por parte da Administração Pública;\n\n"
                    "RECLAMAÇÃO: demonstração de insatisfação relativa a serviço público;\n\n"
                    "SIMPLIFIQUE: Se a prestação de um serviço público for muito burocrática, poderá apresentar solicitação de simplificação, "
                    "por meio de formulário próprio, denominado Simplifique!"
            ),

            const SizedBox(height: 24),

            _buildParagraph(
                "Registre sua manifestação através do sistema Fala.BR, acessando o banner acima.\n\n"
                    "É possível, caso seja necessário, o contato com a ouvidoria de maneira presencial, mediante agendamento através do telefone "
                    "ou do e-mail.\n"
            ),

            // Telefone clicável
            _buildLinkLine("Telefone / WhatsApp: (53) 99702-9358", "tel:53997029358"),

            // E-mail clicável
            _buildLinkLine("E-mail: ouvidoria@ifsul.edu.br", "mailto:ouvidoria@ifsul.edu.br"),

            const SizedBox(height: 16),
            _buildParagraph(
                "A ouvidoria do IFSul está localizada no prédio da Reitoria do instituto, na rua Gonçalves Chaves, 3218. "
                    "Centro - Pelotas/RS, na sala 512."
            ),
            const SizedBox(height: 16),

            // Banner fala.png
            Image.asset(
              "assets/images/fala.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  // --- Métodos auxiliares de formatação ---

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: estilos_visuais.temaPrincipal,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(fontSize: 14, height: 1.4),
    );
  }

  /// Cria um widget de link (texto sublinhado e clicável).
  Widget _buildLinkLine(String text, String url) {
    return InkWell(
      onTap: () => _abrirLink(url),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
