class Product {
  final String id;
  final String name;
  final String variant;
  final String category;
  final double price;
  final int quantity;
  final String description;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.variant,
    required this.category,
    required this.price,
    required this.quantity,
    required this.description,
    required this.imageUrl,
  });

  String get displayName => '$name / $variant';

  StockStatus get stockStatus {
    if (quantity == 0) return StockStatus.outOfStock;
    if (quantity < 10) return StockStatus.lowStock;
    return StockStatus.inStock;
  }
}

enum StockStatus {
  inStock,
  lowStock,
  outOfStock,
}
