import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class GeneralInfoSection extends StatelessWidget {
  const GeneralInfoSection({
    super.key,
    required this.nameController,
    required this.descriptionController,
    this.nameError,
    this.descriptionError,
  });

  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final String? nameError;
  final String? descriptionError;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'General Information',
      children: [
        LabeledField(
          label: 'Product Name',
          child: TextField(
            controller: nameController,
            decoration: AppInputDecoration(
              hint: 'e.g. Wireless Noise-Cancelling Headphones',
              errorText: nameError,
            ),
          ),
        ),
        const SizedBox(height: 20),
        LabeledField(
          label: 'Description',
          child: TextField(
            controller: descriptionController,
            maxLines: 4,
            decoration: AppInputDecoration(
              hint: 'Describe the product features, specs, and benefits...',
              errorText: descriptionError,
            ),
          ),
        ),
      ],
    );
  }
}
