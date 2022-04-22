import 'package:flutter/material.dart';

class Contributions extends StatelessWidget {
  const Contributions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas últimas contribuições:'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Contribuições!'),
            Text('Nova contribuição'),
          ],
        ),
      ),
    );
  }
}
