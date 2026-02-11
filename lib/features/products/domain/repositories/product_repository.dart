import 'package:admin_dashboard/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/product.dart';
import '../entities/product_stats.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, ProductStats>> getStats();
  Future<Either<Failure, void>> addProduct(Product product);
  Future<Either<Failure, void>> updateProduct(Product product);
  Future<Either<Failure, void>> deleteProduct(String productId);
}
