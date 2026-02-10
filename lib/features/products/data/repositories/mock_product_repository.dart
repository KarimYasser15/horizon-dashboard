import 'package:admin_dashboard/features/products/domain/entities/product.dart';
import 'package:admin_dashboard/features/products/domain/entities/product_stats.dart';
import 'package:admin_dashboard/features/products/domain/repositories/product_repository.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    return [
      Product(
        id: '1',
        name: 'SonicPro Headphones',
        variant: 'Matte Black',
        category: 'Electronics',
        price: 249.00,
        quantity: 45,
        description: 'Premium noise-cancelling headphones with 30-hour battery life.',
        imageUrl: 'https://images.pexels.com/photos/1649771/pexels-photo-1649771.jpeg',
      ),
      Product(
        id: '2',
        name: 'ErgoLift Chair',
        variant: 'Slate Grey',
        category: 'Furniture',
        price: 399.00,
        quantity: 124,
        description: 'Ergonomic office chair with adjustable lumbar support and armrests.',
        imageUrl: 'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg',
      ),
      Product(
        id: '3',
        name: 'Gaming Keyboard',
        variant: 'RGB / Brown Switch',
        category: 'Electronics',
        price: 149.00,
        quantity: 86,
        description: 'Mechanical gaming keyboard with RGB backlighting and tactile switches.',
        imageUrl: 'https://images.pexels.com/photos/2115257/pexels-photo-2115257.jpeg',
      ),
      Product(
        id: '4',
        name: 'Ceramic Mug Set',
        variant: 'White',
        category: 'Home & Kitchen',
        price: 24.99,
        quantity: 8,
        description: 'Set of 4 handcrafted ceramic mugs perfect for coffee or tea.',
        imageUrl: 'https://images.pexels.com/photos/3735410/pexels-photo-3735410.jpeg',
      ),
      Product(
        id: '5',
        name: 'SmartWatch Pro',
        variant: 'Midnight Blue',
        category: 'Wearables',
        price: 199.00,
        quantity: 0,
        description: 'Fitness tracker with heart rate monitor and GPS capabilities.',
        imageUrl: 'https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg',
      ),
    ];
  }

  @override
  Future<ProductStats> getStats() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return const ProductStats(
      totalProducts: 428,
      outOfStock: 12,
      totalValue: 84230.00,
      categories: 16,
    );
  }
}
