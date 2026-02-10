import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          breadcrumbTrail: ['Settings', 'Security'],
          title: 'Security',
          description: 'Password, 2FA, and session settings.',
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
            child: Text(
              'Security settings — add your form here.',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ),
          ),
        ),
      ],
    );
  }
}
