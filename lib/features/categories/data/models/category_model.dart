import 'package:admin_dashboard/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.description,
    required super.itemsCount,
    required super.imageUrl,
    required super.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      itemsCount: json['itemsCount'] as int,
      imageUrl: json['imageUrl'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'itemsCount': itemsCount,
      'imageUrl': imageUrl,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      slug: category.slug,
      description: category.description,
      itemsCount: category.itemsCount,
      imageUrl: category.imageUrl,
      updatedAt: category.updatedAt,
    );
  }
}
