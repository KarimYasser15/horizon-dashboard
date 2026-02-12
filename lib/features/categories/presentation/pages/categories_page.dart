import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_state.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/add_category_button.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/categories_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          breadcrumbTrail: const ['Dashboard', 'Categories'],
          title: 'Categories',
          description: 'Organize your products into catalog groups.',
          trailing: const AddCategoryButton(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading ||
                    state is CategoriesInitial ||
                    state is CategoriesAdding ||
                    state is CategoriesAdded) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CategoriesError) {
                  return Center(child: Text(state.message));
                }
                if (state is CategoriesLoaded) {
                  return CategoriesGrid(categories: state.categories);
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
