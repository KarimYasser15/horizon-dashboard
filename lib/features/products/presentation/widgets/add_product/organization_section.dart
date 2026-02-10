import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class OrganizationSection extends StatelessWidget {
  const OrganizationSection({
    super.key,
    required this.category,
    required this.onCategoryChanged,
    required this.productTypeController,
    required this.tagsController,
  });

  final String? category;
  final ValueChanged<String?> onCategoryChanged;
  final TextEditingController productTypeController;
  final TextEditingController tagsController;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Organization',
      children: [
        LabeledField(
          label: 'Category',
          child: DropdownButtonFormField<String>(
            value: category,
            decoration: AppInputDecoration(hint: 'Select category...'),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
            items: ['Electronics', 'Clothing', 'Home', 'Beauty']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onCategoryChanged,
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
