// lib/widgets/moto_data_widget.dart

class MotoDataWidget {
  final String marcaModelo;
  final double fuelTankLiters;
  final double consumptionL100;

  const MotoDataWidget({
    required this.marcaModelo,
    required this.fuelTankLiters,
    required this.consumptionL100,
  });

  double get autonomiaTotalKm {
    if (consumptionL100 == 0) return 0;
    return (fuelTankLiters / consumptionL100) * 100;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MotoDataWidget &&
          runtimeType == other.runtimeType &&
          marcaModelo == other.marcaModelo &&
          fuelTankLiters == other.fuelTankLiters &&
          consumptionL100 == other.consumptionL100;

  @override
  int get hashCode =>
      Object.hash(marcaModelo, fuelTankLiters, consumptionL100);
}