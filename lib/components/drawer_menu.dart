import 'dart:io';

import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20
              )
            )
          ),
          ListTile(
            title: const Text('Gerenciar Jogadores'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Posições"),
            onTap: () {
              Navigator.pushNamed(context, '/position');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Sair"),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}