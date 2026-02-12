import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:admin_dashboard/core/error/failures.dart';
import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/domain/repositories/category_repository.dart';
import 'package:admin_dashboard/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:admin_dashboard/features/categories/data/models/category_model.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addCategory(Category category) async {
    try {
      final model = CategoryModel.fromEntity(category);
      await remoteDataSource.addCategory(model);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(Category category) async {
    try {
      final model = CategoryModel.fromEntity(category);
      await remoteDataSource.updateCategory(model);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String id) async {
    try {
      await remoteDataSource.deleteCategory(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
