// lib/providers/moto_provider.dart

import 'package:flutter/material.dart';
import '../widgets/moto_data_widget.dart';

const List<MotoDataWidget> llistaMotos = [
  MotoDataWidget(
      marcaModelo: 'Honda PCX 125', fuelTankLiters: 8.0, consumptionL100: 2.1),
  MotoDataWidget(
      marcaModelo: 'Yamaha NMAX 125',
      fuelTankLiters: 7.1,
      consumptionL100: 2.2),
  MotoDataWidget(
      marcaModelo: 'Kymco Agility City 125',
      fuelTankLiters: 7.0,
      consumptionL100: 2.5),
  MotoDataWidget(
      marcaModelo: 'Piaggio Liberty 125',
      fuelTankLiters: 6.0,
      consumptionL100: 2.3),
  MotoDataWidget(
      marcaModelo: 'Sym Symphony 125',
      fuelTankLiters: 5.5,
      consumptionL100: 2.4),
  MotoDataWidget(
      marcaModelo: 'Vespa Primavera 125',
      fuelTankLiters: 8.0,
      consumptionL100: 2.8),
  MotoDataWidget(
      marcaModelo: 'Kawasaki J125',
      fuelTankLiters: 11.0,
      consumptionL100: 3.5),
  MotoDataWidget(
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