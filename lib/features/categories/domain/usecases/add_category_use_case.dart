import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:admin_dashboard/core/error/failures.dart';
import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/domain/repositories/category_repository.dart';

@lazySingleton
class AddCategoryUseCase {
  final CategoryRepository repository;

  AddCategoryUseCase(this.repository);

  Future<Either<Failure, void>> call(Category category) async {
    return await repository.addCategory(category);
  }
}
