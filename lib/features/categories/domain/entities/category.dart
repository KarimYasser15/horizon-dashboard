import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String description;
  final int itemsCount;
  final String imageUrl;
  final DateTime updatedAt;

  const Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.itemsCount,
    required this.imageUrl,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    description,
    itemsCount,
    imageUrl,
    updatedAt,
  ];
}
