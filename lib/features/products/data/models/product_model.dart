import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.variant,
    required super.category,
    required super.price,
    super.compareAtPrice,
    required super.quantity,
    required super.description,
    required super.imageUrl,
    super.sku,
    super.tags,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      variant: json['variant'] as String? ?? '',
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      compareAtPrice: json['compareAtPrice'] != null
          ? (json['compareAtPrice'] as num).toDouble()
          : null,
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      sku: json['sku'] as String? ?? '',
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'variant': variant,
      'category': category,
      'price': price,
      'compareAtPrice': compareAtPrice,
      'quantity': quantity,
      'description': description,
      'imageUrl': imageUrl,
      'sku': sku,
      'tags': tags,
    };
  }

  factory ProductModel.fromEntity(Product entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      variant: entity.variant,
      category: entity.category,
      price: entity.price,
      compareAtPrice: entity.compareAtPrice,
      quantity: entity.quantity,
      description: entity.description,
      imageUrl: entity.imageUrl,
      sku: entity.sku,
      tags: entity.tags,
    );
  }
}
