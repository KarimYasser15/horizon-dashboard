import 'package:admin_dashboard/features/products/domain/usecases/get_product_stats_use_case.dart';
import 'package:admin_dashboard/features/products/domain/usecases/get_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
    this._getProductsUseCase,
    this._getProductStatsUseCase,
  ) : super(const ProductsInitial());

  final GetProductsUseCase _getProductsUseCase;
  final GetProductStatsUseCase _getProductStatsUseCase;

  Future<void> loadProducts() async {
    emit(const ProductsLoading());
    try {
      final products = await _getProductsUseCase();
      final stats = await _getProductStatsUseCase();
      emit(ProductsLoaded(products: products, stats: stats));
    } catch (e) {
      emit(ProductsError('Failed to load products'));
    }
  }

  void updateSearchQuery(String query) {
    final currentState = state;
    if (currentState is ProductsLoaded) {
      emit(currentState.copyWith(searchQuery: query));
    }
  }
}
