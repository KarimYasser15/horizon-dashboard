import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          breadcrumbTrail: ['Dashboard', 'Customers'],
          title: 'Customers',
          description: 'Manage customer accounts and segments.',
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
            child: Text(
              'Customers list — add your customer table here.',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ),
          ),
        ),
      ],
    );
  }
}
