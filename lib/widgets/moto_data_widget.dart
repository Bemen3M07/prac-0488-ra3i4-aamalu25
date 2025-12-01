// lib/widgets/moto_data_widget.dart

import 'package:flutter/material.dart';

class MotoDataWidget extends StatelessWidget {
  final String marcaModelo;
  final double fuelTankLiters;
  final double consumptionL100;

  const MotoDataWidget({
    super.key,
    required this.marcaModelo,
    required this.fuelTankLiters,
    required this.consumptionL100,
  });

  double get autonomiaTotalKm {
    if (consumptionL100 == 0) return 0;
    return (fuelTankLiters / consumptionL100) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); 
  }
}