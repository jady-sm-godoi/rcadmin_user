import 'package:flutter/material.dart';

import 'package:rcadmin_user/model/user_profile.dart';

class Frequencies extends StatelessWidget {
  const Frequencies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas últimas frequencias:'),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text('frequencias'),
      ),
    );
  }
}
