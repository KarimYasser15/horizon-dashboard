import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:flutter/material.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          breadcrumbTrail: ['Settings', 'General'],
          title: 'General',
          description: 'Store name, currency, and general preferences.',
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
            child: Text(
              'General settings form — add your fields here.',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ),
          ),
        ),
      ],
    );
  }
}
