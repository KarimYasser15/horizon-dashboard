import 'package:admin_dashboard/config/app_theme.dart';
import 'package:admin_dashboard/core/shell/main_screen.dart';
import 'package:admin_dashboard/features/categories/data/repositories/mock_category_repository.dart';
import 'package:admin_dashboard/features/categories/domain/usecases/get_categories_use_case.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:admin_dashboard/features/products/data/repositories/mock_product_repository.dart';
import 'package:admin_dashboard/features/products/domain/usecases/get_product_stats_use_case.dart';
import 'package:admin_dashboard/features/products/domain/usecases/get_products_use_case.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryRepository = MockCategoryRepository();
    final getCategoriesUseCase = GetCategoriesUseCase(categoryRepository);

    final productRepository = MockProductRepository();
    final getProductsUseCase = GetProductsUseCase(productRepository);
    final getProductStatsUseCase = GetProductStatsUseCase(productRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CategoriesCubit(getCategoriesUseCase)..loadCategories(),
        ),
        BlocProvider(
          create: (_) =>
              ProductsCubit(getProductsUseCase, getProductStatsUseCase)
                ..loadProducts(),
        ),
      ],
      child: MaterialApp(
        title: 'Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const MainScreen(),
      ),
    );
  }
}
