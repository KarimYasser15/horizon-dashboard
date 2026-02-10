import 'package:admin_dashboard/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductTableRow {
  static DataRow build(Product product) {
    return DataRow(
      cells: [
        DataCell(_buildProductInfo(product)),
        DataCell(_buildCategoryBadge(product)),
        DataCell(_buildPrice(product)),
        DataCell(_buildQuantity(product)),
        DataCell(_buildDescription(product)),
        DataCell(_buildActions(product)),
      ],
    );
  }

  static Widget _buildProductInfo(Product product) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            product.imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 48,
                height: 48,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, size: 24),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                product.variant,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildCategoryBadge(Product product) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(product.category, style: const TextStyle(fontSize: 12)),
    );
  }

  static Widget _buildPrice(Product product) {
    return Text(
      '\$${product.price.toStringAsFixed(2)}',
      style: const TextStyle(fontWeight: FontWeight.w600),
    );
  }

  static Widget _buildQuantity(Product product) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: product.stockStatus == StockStatus.outOfStock
                ? const Color(0xFFEF4444)
                : product.stockStatus == StockStatus.lowStock
                ? const Color(0xFFF59E0B)
                : const Color(0xFF10B981),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text('${product.quantity}'),
      ],
    );
  }

  static Widget _buildDescription(Product product) {
    return SizedBox(
      width: 200,
      child: Text(
        product.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
      ),
    );
  }

  static Widget _buildActions(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.edit_outlined,
            size: 18,
            color: Colors.grey.shade700,
          ),
          style: IconButton.styleFrom(
            minimumSize: const Size(32, 32),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline,
            size: 18,
            color: Color(0xFFEF4444),
          ),
          style: IconButton.styleFrom(
            minimumSize: const Size(32, 32),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
