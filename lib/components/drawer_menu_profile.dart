import 'package:flutter/material.dart';
import 'package:rcadmin_user/components/profile_components/profile_image.dart';
import 'package:rcadmin_user/model/user_profile.dart';

import 'package:rcadmin_user/pages/frequencies.dart';

class DrawerMenuProfile extends StatelessWidget {
  final List<UserProfile?> user;

  const DrawerMenuProfile({
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
                    ProfileImage(
                      imageUrl: user[0]!.image,
                      imageHeight: 80,
                      imageWidth: 80,
                      marginHeight: 90,
                      marginWidth: 90,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          user[0]!.id,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Núcleo Aquarius',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const Divider(),
                        const Text(
                          '11 3208-8682 | 11 94570-0480',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const Text(
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
                const Divider(),
                const Text(
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
