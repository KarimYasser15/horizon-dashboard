import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          breadcrumbTrail: ['Dashboard', 'Orders'],
          title: 'Orders',
          description: 'View and manage customer orders.',
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
            child: Text(
              'Orders list — add your orders table here.',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ),
          ),
        ),
      ],
    );
  }
}
