// lib/providers/moto_provider.dart

import 'package:flutter/material.dart';
import '../widgets/moto_data_widget.dart';

final List<MotoDataWidget> llistaMotos = [
  const MotoDataWidget(
    marcaModelo: 'Honda PCX 125', fuelTankLiters: 8.0, consumptionL100: 2.1),
  const MotoDataWidget(
    marcaModelo: 'Yamaha NMAX 125',
    fuelTankLiters: 7.1,
    consumptionL100: 2.2),
  const MotoDataWidget(
    marcaModelo: 'Kymco Agility City 125',
    fuelTankLiters: 7.0,
    consumptionL100: 2.5),
  const MotoDataWidget(
    marcaModelo: 'Piaggio Liberty 125',
    fuelTankLiters: 6.0,
    consumptionL100: 2.3),
  const MotoDataWidget(
    marcaModelo: 'Sym Symphony 125',
    fuelTankLiters: 5.5,
    consumptionL100: 2.4),
  const MotoDataWidget(
    marcaModelo: 'Vespa Primavera 125',
    fuelTankLiters: 8.0,
    consumptionL100: 2.8),
  const MotoDataWidget(
    marcaModelo: 'Kawasaki J125',
    fuelTankLiters: 11.0,
    consumptionL100: 3.5),
  const MotoDataWidget(
    marcaModelo: 'Peugeot Pulsion 125',
    fuelTankLiters: 12.0,
    consumptionL100: 3.0),
];

class MotoProvider extends ChangeNotifier {
  MotoDataWidget? _motoSeleccionada;

  MotoDataWidget? get motoSeleccionada => _motoSeleccionada;
  List<MotoDataWidget> get motosDisponibles => llistaMotos;

  void setMotoSeleccionada(MotoDataWidget moto) {
    _motoSeleccionada = moto;
    notifyListeners(); 
  }
  
}