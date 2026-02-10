import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/domain/repositories/category_repository.dart';

class MockCategoryRepository implements CategoryRepository {
  MockCategoryRepository();

  static final DateTime _now = DateTime.now();

  @override
  Future<List<Category>> getCategories() async {
    // Simulate network latency for a more realistic demo.
    await Future<void>.delayed(const Duration(milliseconds: 400));

    return [
      Category(
        id: 'electronics',
        title: 'Electronics',
        description:
            'Headphones, cameras, smart devices, and computer accessories.',
        itemsCount: 124,
        imageUrl:
            'https://images.pexels.com/photos/1337247/pexels-photo-1337247.jpeg',
        updatedAt: _now.subtract(const Duration(hours: 2)),
      ),
      Category(
        id: 'furniture',
        title: 'Furniture',
        description: 'Modern chairs, dining tables, and storage solutions.',
        itemsCount: 45,
        imageUrl:
            'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg',
        updatedAt: _now.subtract(const Duration(days: 1)),
      ),
      Category(
        id: 'apparel',
        title: 'Apparel',
        description: 'Men’s and women’s casual wear, activewear, and more.',
        itemsCount: 89,
        imageUrl:
            'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg',
        updatedAt: _now.subtract(const Duration(days: 3)),
      ),
      Category(
        id: 'home_kitchen',
        title: 'Home & Kitchen',
        description:
            'Cookware, dining sets, small appliances, and organization tools.',
        itemsCount: 67,
        imageUrl:
            'https://images.pexels.com/photos/3735410/pexels-photo-3735410.jpeg',
        updatedAt: _now.subtract(const Duration(days: 5)),
      ),
      Category(
        id: 'sports_outdoors',
        title: 'Sports & Outdoors',
        description:
            'Yoga mats, resistance bands, water bottles, and more gear.',
        itemsCount: 12,
        imageUrl:
            'https://images.pexels.com/photos/6453399/pexels-photo-6453399.jpeg',
        updatedAt: _now.subtract(const Duration(days: 7)),
      ),
    ];
  }
}

