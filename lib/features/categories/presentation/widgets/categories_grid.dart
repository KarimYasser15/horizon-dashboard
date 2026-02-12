import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:admin_dashboard/features/categories/presentation/pages/add_category_page.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/category_card.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/create_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        int crossAxisCount;

        if (width >= 1200) {
          crossAxisCount = 3;
        } else if (width >= 900) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: 340,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: categories.length + 1,
          itemBuilder: (context, index) {
            if (index == categories.length) {
              return const CreateCategoryCard();
            }

            final category = categories[index];
            return CategoryCard(
              category: category,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCategoryPage(category: category),
                  ),
                );
              },
              onDelete: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Category'),
                    content: Text(
                      'Are you sure you want to delete "${category.name}"? This action cannot be undone.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<CategoriesCubit>().deleteCategory(
                                category.id,
                              );
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFEF4444),
                        ),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
