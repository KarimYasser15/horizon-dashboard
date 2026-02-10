import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/features/products/domain/entities/product_stats.dart';
import 'package:flutter/material.dart';

class ProductStatsCards extends StatelessWidget {
  const ProductStatsCards({super.key, required this.stats});

  final ProductStats stats;

  String _formatCurrency(double value) {
    final formatted = value.toStringAsFixed(0);
    return '\$${formatted.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        if (isWide) {
          return Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Total Products',
                  value: '${stats.totalProducts}',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Out of Stock',
                  value: '${stats.outOfStock}',
                  valueColor: const Color(0xFFEF4444),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Total Value',
                  value: _formatCurrency(stats.totalValue),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Categories',
                  value: '${stats.categories}',
                ),
              ),
            ],
          );
        }
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: 'Total Products',
                    value: '${stats.totalProducts}',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    title: 'Out of Stock',
                    value: '${stats.outOfStock}',
                    valueColor: const Color(0xFFEF4444),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: 'Total Value',
                    value: _formatCurrency(stats.totalValue),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    title: 'Categories',
                    value: '${stats.categories}',
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.title, required this.value, this.valueColor});

  final String title;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: valueColor ?? const Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }
}
