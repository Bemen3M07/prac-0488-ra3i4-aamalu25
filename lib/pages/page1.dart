// lib/pages/page1.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/moto_provider.dart';
import '../widgets/moto_data_widget.dart';
import 'page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final motoProvider = context.watch<MotoProvider>();

    final MotoDataWidget? moto = motoProvider.motoSeleccionada;

    String desplegableText;
    if (moto != null) {
      desplegableText = ' ${moto.marcaModelo}'; 
    } else {
      desplegableText = 'Selecciona una moto';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccion de Moto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selecciona el modelo de moto que quieras:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            
            // DESPLEGABLE 
            DropdownButton<MotoDataWidget>(
              hint: const Text('Escoge una moto'),
              value: moto,
              items: motoProvider.motosDisponibles
                  .map<DropdownMenuItem<MotoDataWidget>>((MotoDataWidget motoItem) {
                return DropdownMenuItem<MotoDataWidget>(
                  value: motoItem,
                  child: Text(motoItem.marcaModelo), 
                );
              }).toList(),
              onChanged: (MotoDataWidget? novaMoto) {
                if (novaMoto != null) {
                  context.read<MotoProvider>().setMotoSeleccionada(novaMoto);
                }
              },
            ),
            
            const SizedBox(height: 30),
            // Texto del desplegable
            Text(
              desplegableText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 48),
            
          
            ElevatedButton(
              onPressed: moto == null
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Page2(),
                        ),
                      );
                    },
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}