import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_state.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product_button.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/product_stats_cards.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/products_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          breadcrumbTrail: ['Dashboard', 'Products'],
          title: 'Products',
          description: 'Manage your product catalog, inventory, and pricing.',
          trailing: AddProductButton(),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading || state is ProductsInitial) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductsError) {
                  return Center(child: Text(state.message));
                }
                if (state is ProductsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductStatsCards(stats: state.stats),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ProductsTable(products: state.filteredProducts),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ],
    );
  }
}
