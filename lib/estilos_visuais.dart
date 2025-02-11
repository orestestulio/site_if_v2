import 'package:flutter/material.dart';

class estilos_visuais {
  static final Color temaPrincipal = Colors.green;
  static final Color temaSecundario =
      Colors.green[100] ?? const Color.fromARGB(255, 200, 230, 201);

  static AppBar barraSuperior(String titulo) {
    return AppBar(
      title: Text(titulo),
      backgroundColor: temaPrincipal,
    );
  }

  static Drawer menuLateral(
      BuildContext context,
      List<Widget> itensMenu,
      ) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: temaPrincipal,
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
          ...itensMenu,
        ],
      ),
    );
  }

  static BottomNavigationBar menuInferior(
      List<BottomNavigationBarItem> itens,
      ) {
    return BottomNavigationBar(
      items: itens,
    );
  }

  static FloatingActionButton botaoFlutuante(
      VoidCallback onPressed,
      IconData icone,
      String tooltip,
      ) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icone),
    );
  }
}
