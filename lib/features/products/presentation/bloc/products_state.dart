import 'package:admin_dashboard/features/products/domain/entities/product.dart';
import 'package:admin_dashboard/features/products/domain/entities/product_stats.dart';

sealed class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  final ProductStats stats;
  final String searchQuery;

  const ProductsLoaded({
    required this.products,
    required this.stats,
    this.searchQuery = '',
  });

  ProductsLoaded copyWith({
    List<Product>? products,
    ProductStats? stats,
    String? searchQuery,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      stats: stats ?? this.stats,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<Product> get filteredProducts {
    if (searchQuery.isEmpty) return products;
    final query = searchQuery.toLowerCase();
    return products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query) ||
          product.description.toLowerCase().contains(query);
    }).toList();
  }
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);
}
