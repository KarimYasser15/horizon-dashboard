import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          breadcrumbTrail: ['Dashboard'],
          title: 'Dashboard',
          description: 'Overview of your store and key metrics.',
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
            child: Text(
              'Dashboard content — add charts and stats here.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ),
          ),
        ),
      ],
    );
  }
}
