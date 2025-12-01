// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/page1.dart';
import 'providers/moto_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MotoProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora deposito moto',
      home: Page1(),
    );
  }
}