import 'package:admin_dashboard/features/products/domain/usecases/get_product_stats_use_case.dart';
import 'package:admin_dashboard/features/products/domain/usecases/get_products_use_case.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._getProductsUseCase,
    this._getProductStatsUseCase,
  ) : super(const ProductsInitial());

  final GetProductsUseCase _getProductsUseCase;
  final GetProductStatsUseCase _getProductStatsUseCase;

  Future<void> loadProducts() async {
    emit(const ProductsLoading());
    final productsResult = await _getProductsUseCase();
    final statsResult = await _getProductStatsUseCase();

    productsResult.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) {
        statsResult.fold(
          (failure) => emit(ProductsError(failure.message)),
          (stats) => emit(ProductsLoaded(products: products, stats: stats)),
        );
      },
    );
  }

  void updateSearchQuery(String query) {
    final currentState = state;
    if (currentState is ProductsLoaded) {
      emit(currentState.copyWith(searchQuery: query));
    }
  }
}
