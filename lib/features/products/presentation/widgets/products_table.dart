import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/features/products/domain/entities/product.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/products_table/product_table_row.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/products_table/table_pagination_controls.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/products_table/table_search_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key, required this.products});

  final List<Product> products;

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  late final TextEditingController _searchController;
  int _currentPage = 1;
  static const int _itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _paginatedProducts {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = start + _itemsPerPage;
    return widget.products.sublist(
      start,
      end > widget.products.length ? widget.products.length : end,
    );
  }

  int get _totalPages => (widget.products.length / _itemsPerPage).ceil();

  void _handleSearchChanged(String value) {
    context.read<ProductsCubit>().updateSearchQuery(value);
    setState(() => _currentPage = 1);
  }

  void _handlePreviousPage() {
    setState(() => _currentPage--);
  }

  void _handleNextPage() {
    setState(() => _currentPage++);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TableSearchControls(
            searchController: _searchController,
            onSearchChanged: _handleSearchChanged,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth),
                      child: DataTable(
                        columnSpacing: 24,
                        dataRowMinHeight: 72,
                        dataRowMaxHeight: 72,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Product Name',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Category',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Quantity',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actions',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                        rows: _paginatedProducts
                            .map((product) => ProductTableRow.build(product))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          TablePaginationControls(
            currentPage: _currentPage,
            totalPages: _totalPages,
            totalItems: widget.products.length,
            itemsPerPage: _itemsPerPage,
            onPreviousPage: _handlePreviousPage,
            onNextPage: _handleNextPage,
          ),
        ],
      ),
    );
  }
}
