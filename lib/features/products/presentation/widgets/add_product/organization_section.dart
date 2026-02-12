import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrganizationSection extends StatelessWidget {
  const OrganizationSection({
    super.key,
    required this.category,
    required this.onCategoryChanged,
    required this.productTypeController,
    required this.tagsController,
    this.categoryError,
  });

  final String? category;
  final ValueChanged<String?> onCategoryChanged;
  final TextEditingController productTypeController;
  final TextEditingController tagsController;
  final String? categoryError;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Organization',
      children: [
        LabeledField(
          label: 'Category',
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              final categories = state is CategoriesLoaded
                  ? state.categories.map((e) => e.name).toList()
                  : <String>[];

              final effectiveValue = categories.contains(category) ? category : null;

              return DropdownButtonFormField<String>(
                value: effectiveValue,
                decoration: AppInputDecoration(
                  hint: state is CategoriesLoading
                      ? 'Loading categories...'
                      : 'Select category...',
                  errorText: categoryError,
                ),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                items: categories
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: onCategoryChanged,
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        LabeledField(
          label: 'Product Type',
          child: TextField(
            controller: productTypeController,
            decoration: AppInputDecoration(hint: 'e.g. Headphones'),
          ),
        ),
        const SizedBox(height: 20),
        LabeledField(
          label: 'Tags',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: tagsController,
                decoration: AppInputDecoration(hint: 'Enter tags...'),
              ),
              const SizedBox(height: 6),
              Text(
                'Separate tags with commas',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
