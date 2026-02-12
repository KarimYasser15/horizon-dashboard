import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:admin_dashboard/features/categories/presentation/pages/add_category_page.dart';
import 'package:flutter/material.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddCategoryPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(40),
        backgroundColor: ColorsManager.blue,
        foregroundColor: ColorsManager.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, size: 20),
          SizedBox(width: 8),
          Text(
            'Add Category',
            style: TextStyleManager.interMedium.copyWith(
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
