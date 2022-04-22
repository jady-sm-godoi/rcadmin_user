import 'package:flutter/material.dart';

class Historics extends StatelessWidget {
  const Historics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus últimos históricos:'),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text('Históricos!'),
      ),
    );
  }
}
