import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/category_card.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/create_category_card.dart';
import 'package:flutter/material.dart';

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
              onEdit: () {},
              onDelete: () {},
            );
          },
        );
      },
    );
  }
}
