import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class CategoryInfoSection extends StatelessWidget {
  const CategoryInfoSection({
    super.key,
    required this.nameController,
    required this.slugController,
    required this.descriptionController,
    required this.onNameChanged,
    this.nameError,
    this.slugError,
  });

  final TextEditingController nameController;
  final TextEditingController slugController;
  final TextEditingController descriptionController;
  final ValueChanged<String> onNameChanged;
  final String? nameError;
  final String? slugError;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'General Information',
      children: [
        LabeledField(
          label: 'Category Name',
          child: TextField(
            controller: nameController,
            decoration: AppInputDecoration(
              hint: 'e.g. Summer Collection',
              errorText: nameError,
            ),
            onChanged: onNameChanged,
          ),
        ),
        const SizedBox(height: 24),
        LabeledField(
          label: 'Slug',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: slugController,
                decoration: AppInputDecoration(
                  hint: 'e.g. summer-collection',
                  errorText: slugError,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'URL-friendly version of the name.',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        LabeledField(
          label: 'Description',
          child: TextField(
            controller: descriptionController,
            maxLines: 4,
            decoration: AppInputDecoration(hint: 'Describe this category...'),
          ),
        ),
      ],
    );
  }
}

class CategoryMediaSection extends StatelessWidget {
  const CategoryMediaSection({
    super.key,
    required this.imageUrlController,
    required this.previewImageUrl,
    required this.onFetch,
    this.imageUrlError,
  });

  final TextEditingController imageUrlController;
  final String? previewImageUrl;
  final VoidCallback onFetch;
  final String? imageUrlError;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Category Image',
      children: [
        LabeledField(
          label: 'Category Image URL',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: imageUrlController,
                      decoration: AppInputDecoration(
                        hint: 'https://example.com/image.jpg',
                        errorText: imageUrlError,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.link, color: Colors.grey.shade400),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: onFetch,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      backgroundColor: const Color(0xFFEFF6FF),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Preview',
                      style: TextStyleManager.interMedium.copyWith(
                        color: ColorsManager.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Paste a direct link to an image (JPG, PNG, WebP).',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        if (previewImageUrl != null && previewImageUrl!.isNotEmpty) ...[
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              previewImageUrl!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        ],
      ],
    );
  }
}
