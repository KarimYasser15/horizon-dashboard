import 'package:admin_dashboard/core/di/register_module.dart' as _i16;
import 'package:admin_dashboard/features/categories/data/datasources/category_remote_data_source.dart'
    as _i585;
import 'package:admin_dashboard/features/categories/data/repositories/category_repository_impl.dart'
    as _i851;
import 'package:admin_dashboard/features/categories/domain/repositories/category_repository.dart'
    as _i395;
import 'package:admin_dashboard/features/categories/domain/usecases/add_category_use_case.dart'
    as _i51;
import 'package:admin_dashboard/features/categories/domain/usecases/delete_category_use_case.dart'
    as _i570;
import 'package:admin_dashboard/features/categories/domain/usecases/get_categories_use_case.dart'
    as _i248;
import 'package:admin_dashboard/features/categories/domain/usecases/update_category_use_case.dart'
    as _i410;
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart'
    as _i346;
import 'package:admin_dashboard/features/products/data/datasources/product_remote_data_source.dart'
    as _i995;
import 'package:admin_dashboard/features/products/data/repositories/product_repository_impl.dart'
    as _i901;
import 'package:admin_dashboard/features/products/domain/repositories/product_repository.dart'
    as _i983;
import 'package:admin_dashboard/features/products/domain/usecases/add_product_use_case.dart'
    as _i852;
import 'package:admin_dashboard/features/products/domain/usecases/delete_product_use_case.dart'
    as _i114;
import 'package:admin_dashboard/features/products/domain/usecases/get_product_stats_use_case.dart'
    as _i881;
import 'package:admin_dashboard/features/products/domain/usecases/get_products_use_case.dart'
    as _i433;
import 'package:admin_dashboard/features/products/domain/usecases/update_product_use_case.dart'
    as _i589;
import 'package:admin_dashboard/features/products/presentation/bloc/add_product_cubit.dart'
    as _i477;
import 'package:admin_dashboard/features/products/presentation/bloc/delete_product_cubit.dart'
    as _i764;
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart'
    as _i851;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i995.ProductRemoteDataSource>(
      () => _i995.ProductRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i585.CategoryRemoteDataSource>(
      () => _i585.CategoryRemoteDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i983.ProductRepository>(
      () => _i901.ProductRepositoryImpl(gh<_i995.ProductRemoteDataSource>()),
    );
    gh.lazySingleton<_i881.GetProductStatsUseCase>(
      () => _i881.GetProductStatsUseCase(gh<_i983.ProductRepository>()),
    );
    gh.lazySingleton<_i433.GetProductsUseCase>(
      () => _i433.GetProductsUseCase(gh<_i983.ProductRepository>()),
    );
    gh.lazySingleton<_i395.CategoryRepository>(
      () => _i851.CategoryRepositoryImpl(gh<_i585.CategoryRemoteDataSource>()),
    );
    gh.lazySingleton<_i248.GetCategoriesUseCase>(
      () => _i248.GetCategoriesUseCase(gh<_i395.CategoryRepository>()),
    );
    gh.factory<_i851.ProductsCubit>(
      () => _i851.ProductsCubit(
        gh<_i433.GetProductsUseCase>(),
        gh<_i881.GetProductStatsUseCase>(),
      ),
    );
    gh.lazySingleton<_i852.AddProductUseCase>(
      () => _i852.AddProductUseCase(gh<_i983.ProductRepository>()),
    );
    gh.lazySingleton<_i114.DeleteProductUseCase>(
      () => _i114.DeleteProductUseCase(gh<_i983.ProductRepository>()),
    );
    gh.lazySingleton<_i589.UpdateProductUseCase>(
      () => _i589.UpdateProductUseCase(gh<_i983.ProductRepository>()),
    );
    gh.factory<_i764.DeleteProductCubit>(
      () => _i764.DeleteProductCubit(gh<_i114.DeleteProductUseCase>()),
    );
    gh.factory<_i570.DeleteCategoryUseCase>(
      () => _i570.DeleteCategoryUseCase(gh<_i395.CategoryRepository>()),
    );
    gh.factory<_i410.UpdateCategoryUseCase>(
      () => _i410.UpdateCategoryUseCase(gh<_i395.CategoryRepository>()),
    );
    gh.lazySingleton<_i51.AddCategoryUseCase>(
      () => _i51.AddCategoryUseCase(gh<_i395.CategoryRepository>()),
    );
    gh.factory<_i346.CategoriesCubit>(
      () => _i346.CategoriesCubit(
        gh<_i248.GetCategoriesUseCase>(),
        gh<_i410.UpdateCategoryUseCase>(),
        gh<_i570.DeleteCategoryUseCase>(),
      ),
    );
    gh.factory<_i477.AddProductCubit>(
      () => _i477.AddProductCubit(
        gh<_i852.AddProductUseCase>(),
        gh<_i589.UpdateProductUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i16.RegisterModule {}
