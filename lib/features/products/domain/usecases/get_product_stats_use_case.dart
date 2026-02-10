import '../entities/product_stats.dart';
import '../repositories/product_repository.dart';

class GetProductStatsUseCase {
  final ProductRepository _repository;

  const GetProductStatsUseCase(this._repository);

  Future<ProductStats> call() {
    return _repository.getStats();
  }
}
