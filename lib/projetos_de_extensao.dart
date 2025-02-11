import 'package:flutter/material.dart';
import 'estilos_visuais.dart';
import 'menu_lateral.dart';

class projetos_de_extensao extends StatelessWidget {
  const projetos_de_extensao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: estilos_visuais.temaSecundario,

      appBar: estilos_visuais.barraSuperior("Projetos de Extensão"),

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

      // Conteúdo
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("PROJETO: Astromúsica - socialização, ciência e cultura, mente adentro, vida a fora."),
            const SizedBox(height: 8),
            _buildParagraph(
                "Coordenador: Patrick Kovalscki\n\n"
                    "O Astromúsica – socialização, ciência e cultura, mente adentro, vida afora é uma experiência de imersão e "
                    "comprometimento que envolve todos os sujeitos da educação do IFSUL câmpus Camaquã e comunidade local em "
                    "uma atividade autogestionária de produção e usufruto de cultura, arte, socialização e ciência que culmina "
                    "com um evento que dialoga, em uma mesma noite, por doze horas seguidas, toda essa diversidade. "
                    "Sua proposta é possibilitar que estudantes, professores, servidores e comunidade possam ter um espaço e "
                    "tempo para curtir ciência, música e cultura e curtirem-se uns aos outros na rica experiência de construir algo em comum."
            ),
            const SizedBox(height: 24),

            _buildTitle("PROJETO: Raízes: Educação Popular"),
            const SizedBox(height: 8),
            _buildParagraph(
                "Projeto pioneiro em Camaquã e região, o Cursinho Raízes é um projeto de extensão do IFSul - campus Camaquã "
                    "que tem por objetivo oferecer um curso preparatório para jovens e adultos das classes populares para que "
                    "estes possam se qualificar para ingressar na universidade através das provas Enem.\n"
                    "O Raízes é um coletivo de educadores(as) a fim de tornar o conhecimento cada vez mais democrático e "
                    "possibilitar que aquelas pessoas que não disponham de recursos financeiros possam se preparar para os "
                    "processos seletivos das universidades."
            ),
            _buildParagraph(
                "As aulas são gravadas e depois disponibilizadas no canal do YouTube do cursinho:\n"
                    "https://www.youtube.com/results?search_query=ra%C3%ADzes+educa%C3%A7%C3%A3o+popular\n\n"
                    "Para maiores informações, sigam nossas redes sociais:\n"
                    "Twitter: @RaizesPopular\nInstagram: @raizespopular"
            ),
            const SizedBox(height: 24),

            _buildTitle("PROJETO: Traçando o perfil do leitor."),
            const SizedBox(height: 8),
            _buildParagraph(
                "Coordenadora: Sandra Salenave\n\n"
                    "O Traçando Perfil do Leitor é um projeto do Câmpus Camaquã, que possui grande êxito na comunidade no que se refere "
                    "à mediação de leitura e à formação de leitores. A partir de seus resultados, surgiu a demanda de multiplicar "
                    "as ações do clube do livro no câmpus, que são abertas à toda a comunidade, bem como à formação de professores, "
                    "bibliotecários e demais interessados que trabalhem com as séries finais do Ensino Fundamental ou Ensino Médio."
            ),
            const SizedBox(height: 24),

            _buildTitle("PROJETO: FECIC – Feira de Ciências do IFSul Camaquã"),
            const SizedBox(height: 8),
            _buildParagraph(
                "Considerando o compromisso dos Institutos Federais com a formação omnilateral dos alunos e o desenvolvimento "
                    "científico e tecnológico, bem como a carência de ações para divulgação da cultura científica na região, "
                    "o câmpus Camaquã promove sua FECIC: Feira de Ciências do IFSul câmpus Camaquã que se originou da fusão "
                    "dos tradicionais eventos: Mostra de Ciências Exatas e suas Interfaces e Feira de Tecnologia de Camaquã.\n\n"
                    "Durante o evento serão realizadas diversas ações com o propósito de promover a cultura científica regional, "
                    "qualificando o aprendizado dos alunos e aproximando a comunidade externa com o IFSul, possibilitando parcerias "
                    "para o desenvolvimento de arranjos locais.\n\n"
                    "A FECIC promove a realização, apresentação, avaliação e premiação de projetos de Pesquisa, Ensino e Extensão, "
                    "realizados por jovens dos níveis do Ensino Fundamental, Médio, da Educação Profissional de Nível Técnico e do "
                    "Ensino Superior. Alunos de qualquer instituição de ensino podem submeter seus trabalhos, observando o regulamento "
                    "do evento e suas próprias especificações.\n\n"
                    "O evento é aberto ao público e, além da mostra de trabalhos, contará com uma programação diversificada, oferecendo "
                    "visitas guiadas pelo câmpus Camaquã através do projeto “Portas Abertas”, oficinas, palestras e atividades culturais."
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para títulos
  Widget _buildTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: estilos_visuais.temaPrincipal,
      ),
    );
  }

  // Método auxiliar para parágrafos
  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        height: 1.4, // Espaçamento de linha
      ),
      textAlign: TextAlign.justify,
    );
  }
}
