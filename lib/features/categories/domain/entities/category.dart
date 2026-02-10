class Category {
  final String id;
  final String title;
  final String description;
  final int itemsCount;
  final String imageUrl;
  final DateTime updatedAt;

  const Category({
    required this.id,
    required this.title,
    required this.description,
    required this.itemsCount,
    required this.imageUrl,
    required this.updatedAt,
  });
}

