import '../entities/product.dart';
import '../entities/product_stats.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<ProductStats> getStats();
}
