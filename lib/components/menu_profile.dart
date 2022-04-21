import 'package:flutter/material.dart';

class MenuProfile extends StatefulWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  _MenuProfileState createState() => _MenuProfileState();
}

class _MenuProfileState extends State<MenuProfile> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.person),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.card_membership,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Text('Profile'),
                  ],
                ),
                onTap: () {},
                value: 1,
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Text('Senha'),
                  ],
                ),
                onTap: () {},
                value: 1,
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Text('Dark/Light'),
                  ],
                ),
                onTap: () {},
                value: 1,
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    Spacer(),
                    Text('Sair'),
                  ],
                ),
                onTap: () {},
                value: 1,
              ),
            ]);
  }
}
