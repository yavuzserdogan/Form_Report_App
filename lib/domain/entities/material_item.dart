import '../enums/currency.dart';

class MaterialItem {
  final String partName;
  final String? partNumber;
  final int partQuantity;
  final double partPrice;
  final Currency currency;

  MaterialItem({
    required this.partName,
    this.partNumber,
    required this.partQuantity,
    required this.partPrice,
    required this.currency,
  });

  double get totalPrice => partQuantity * partPrice;
}
