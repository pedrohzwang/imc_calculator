import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.person_outline,
            size: 120,
            color: Theme.of(context).colorScheme.primary,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              labelText: 'Peso (kg)',
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
