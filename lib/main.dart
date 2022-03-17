import 'package:flutter/material.dart';

import 'components/menu_profile.dart';

void main() {
  runApp(const UserPage());
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RCADMIN'),
          actions: [
            MenuProfile(),
          ],
          backgroundColor: Colors.blueGrey,
        ),
        drawer: Drawer(
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
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('Profile'),
        ),
      ),
    );
  }
}
