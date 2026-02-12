import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Preview',
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: imageUrl != null && imageUrl!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.image_not_supported,
                            color: Colors.grey, size: 48),
                      );
                    },
                  ),
                )
              : Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Upload an image to see a preview',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}
