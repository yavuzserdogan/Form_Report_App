import '../enums/currency.dart';

class Pricing {
  final double laborUnitPrice;
  final Currency laborCurrency;

  final double transportUnitPrice;
  final Currency transportCurrency;

  const Pricing({
    required this.laborUnitPrice,
    required this.laborCurrency,
    required this.transportUnitPrice,
    required this.transportCurrency,
  });
}
