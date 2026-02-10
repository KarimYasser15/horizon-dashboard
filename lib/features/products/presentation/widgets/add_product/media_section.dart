import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class MediaSection extends StatelessWidget {
  const MediaSection({
    super.key,
    required this.imageUrlController,
    required this.onFetch,
  });

  final TextEditingController imageUrlController;
  final VoidCallback onFetch;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Product Media',
      children: [
        LabeledField(
          label: 'Image URL',
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: imageUrlController,
                  decoration: AppInputDecoration(hint: 'https://'),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: onFetch,
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Fetch',
                    style: TextStyle(color: Color(0xFF374151))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
