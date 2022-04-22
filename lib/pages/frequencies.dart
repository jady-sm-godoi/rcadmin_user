import 'package:flutter/material.dart';

import 'package:rcadmin_user/model/user_profile.dart';

class Frequencies extends StatelessWidget {
  final List<UserProfile?> user;

  const Frequencies({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas últimas frequencias:'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(user[0]!.frequencies?[0]['evento']),
      ),
    );
  }
}
