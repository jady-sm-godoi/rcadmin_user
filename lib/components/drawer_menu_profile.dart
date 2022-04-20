import 'package:flutter/material.dart';
import 'package:rcadmin_user/model/user_profile.dart';

import 'package:rcadmin_user/pages/frequencies.dart';

class DrawerMenuProfile extends StatelessWidget {
  List<UserProfile?> user;

  DrawerMenuProfile({
    Key? key,
    required this.user,
  }) : super(key: key);

  void _frequenciesPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Frequencies();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user[0]!.image),
                      child: Text(user[0]!.id),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Núcleo Aquarius',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Divider(),
                        Text(
                          '11 3208-8682 | 11 94570-0480',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'saopaulo@lr.org.br',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(),
                Text(
                  'Relatórios e contribuições:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Frequências'),
            onTap: () {
              Navigator.pop(context);
              _frequenciesPage(context);
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
