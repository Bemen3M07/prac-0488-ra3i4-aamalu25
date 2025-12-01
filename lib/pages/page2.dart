// lib/pages/page2.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/moto_provider.dart';
import '../widgets/moto_data_widget.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController _kmTotalController = TextEditingController(); 
  final TextEditingController _kmReposController = TextEditingController(); 
  
  String? _resultMessage;

  void _calculateAutonomy(MotoDataWidget moto) {
    final double? kmTotal = double.tryParse(_kmTotalController.text);
    final double? kmRepos = double.tryParse(_kmReposController.text);

    if (kmTotal == null || kmRepos == null || kmTotal < kmRepos) {
      setState(() {
        _resultMessage = 'Rellena los datos para calcular';
      });
      return;
    }
    final double autonomiaTotal = moto.autonomiaTotalKm;
    final double kmFets = kmTotal - kmRepos;
    final double kmRestants = autonomiaTotal - kmFets;

    setState(() {
      if (kmRestants > 0) {
        _resultMessage = 'KM restantes: ${kmRestants.toStringAsFixed(1)} km';
      } else {
        _resultMessage = 'El deposito esta vacio (Resultado: ${kmRestants.toStringAsFixed(1)} km)';
      }
    });
  }

  @override
  void dispose() {
    _kmTotalController.dispose();
    _kmReposController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final motoProvider = context.watch<MotoProvider>();
    final MotoDataWidget? moto = motoProvider.motoSeleccionada; 

    if (moto == null) {
      return const Scaffold(body: Center(child: Text('No has seleccionado ninguna moto.')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(' Calculo de autonomia '),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Modelo: ${moto.marcaModelo}'),
            Text('Deposito: ${moto.fuelTankLiters.toStringAsFixed(1)} L'),
            Text('Consumo: ${moto.consumptionL100.toStringAsFixed(1)} L/100km'),
            
            const SizedBox(height: 30),

            const Text('Km Total :'),
            TextField(
              controller: _kmTotalController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            
            // --- KM REPOS (km omplir dipòsit) ---
            const Text('Km Repos:'),
            TextField(
              controller: _kmReposController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),

            // BOTÓN 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _calculateAutonomy(moto),
                child: const Text('CALCULAR'),
              ),
            ),
            const SizedBox(height: 40),

            if (_resultMessage != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Resultado:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(_resultMessage!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}