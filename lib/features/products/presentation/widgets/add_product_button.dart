import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/features/products/presentation/pages/add_product_page.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddProductPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, size: 20),
          SizedBox(width: 8),
          Text('Add Product'),
        ],
      ),
    );
  }
}
