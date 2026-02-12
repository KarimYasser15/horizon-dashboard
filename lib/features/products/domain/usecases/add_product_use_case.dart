import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class AddProductUseCase {
  final ProductRepository repository;

  AddProductUseCase(this.repository);

  Future<Either<Failure, void>> call(Product product) async {
    return await repository.addProduct(product);
  }
}
