import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:admin_dashboard/core/error/failures.dart';
import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/domain/repositories/category_repository.dart';

@lazySingleton
class GetCategoriesUseCase {
  final CategoryRepository _repository;

  const GetCategoriesUseCase(this._repository);

  Future<Either<Failure, List<Category>>> call() {
    return _repository.getCategories();
  }
}

