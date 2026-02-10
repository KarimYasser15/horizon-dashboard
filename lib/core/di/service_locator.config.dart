// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_dashboard/core/di/register_module.dart' as _i16;
import 'package:admin_dashboard/features/categories/data/datasources/category_remote_data_source.dart'
    as _i585;
import 'package:admin_dashboard/features/categories/data/repositories/category_repository_impl.dart'
    as _i851;
import 'package:admin_dashboard/features/categories/domain/repositories/category_repository.dart'
    as _i395;
import 'package:admin_dashboard/features/categories/domain/usecases/add_category_use_case.dart'
    as _i51;
import 'package:admin_dashboard/features/categories/domain/usecases/get_categories_use_case.dart'
    as _i248;
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart'
    as _i346;
import 'package:admin_dashboard/features/products/data/repositories/mock_product_repository.dart'
    as _i794;
import 'package:admin_dashboard/features/products/domain/repositories/product_repository.dart'
    as _i983;
import 'package:admin_dashboard/features/products/domain/usecases/get_product_stats_use_case.dart'
    as _i881;
import 'package:admin_dashboard/features/products/domain/usecases/get_products_use_case.dart'
    as _i433;
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart'
    as _i851;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i983.ProductRepository>(
      () => _i794.MockProductRepository(),
    );
    gh.lazySingleton<_i881.GetProductStatsUseCase>(
      () => _i881.GetProductStatsUseCase(gh<_i983.ProductRepository>()),
    );
    gh.lazySingleton<_i433.GetProductsUseCase>(
      () => _i433.GetProductsUseCase(gh<_i983.ProductRepository>()),
    );
    gh.lazySingleton<_i585.CategoryRemoteDataSource>(
      () => _i585.CategoryRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i851.ProductsCubit>(
      () => _i851.ProductsCubit(
        gh<_i433.GetProductsUseCase>(),
        gh<_i881.GetProductStatsUseCase>(),
      ),
    );
    gh.lazySingleton<_i395.CategoryRepository>(
      () => _i851.CategoryRepositoryImpl(gh<_i585.CategoryRemoteDataSource>()),
    );
    gh.lazySingleton<_i248.GetCategoriesUseCase>(
      () => _i248.GetCategoriesUseCase(gh<_i395.CategoryRepository>()),
    );
    gh.factory<_i346.CategoriesCubit>(
      () => _i346.CategoriesCubit(gh<_i248.GetCategoriesUseCase>()),
    );
    gh.lazySingleton<_i51.AddCategoryUseCase>(
      () => _i51.AddCategoryUseCase(gh<_i395.CategoryRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
