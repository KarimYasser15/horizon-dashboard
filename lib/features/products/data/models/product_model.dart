import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.variant,
    required super.category,
    required super.price,
    required super.quantity,
    required super.description,
    required super.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      variant: json['variant'] as String? ?? '',
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'variant': variant,
      'category': category,
      'price': price,
      'quantity': quantity,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      variant: entity.variant,
      category: entity.category,
      price: entity.price,
      quantity: entity.quantity,
      description: entity.description,
      imageUrl: entity.imageUrl,
    );
  }
}
