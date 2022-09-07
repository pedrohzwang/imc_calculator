import 'package:flutter/material.dart';
import 'package:imc_calculator/pages/home.dart';
import 'package:imc_calculator/themes/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'IMC Calculator',
      home: const Home(),
    ),
  );
}
