import 'package:flutter/material.dart';

class DrawerMenuProfile extends StatelessWidget {
  const DrawerMenuProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text('Relatórios e contribuições:'),
          ),
          ListTile(
            title: const Text('Frequências'),
            onTap: () {
              print('Frequencias');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Histórico'),
            onTap: () {
              print('Histórico');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Contribuições'),
            onTap: () {
              print('Contribuições/Tesouraria');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
