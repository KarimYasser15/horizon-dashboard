import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

@injectable
class UpdateCategoryUseCase {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  Future<Either<Failure, void>> call(Category category) async {
    return await repository.updateCategory(category);
  }
}
