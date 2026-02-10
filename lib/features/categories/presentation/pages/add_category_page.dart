import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/shell/main_screen.dart';
import 'package:admin_dashboard/core/widgets/main_shell.dart';
import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/add_category_sections.dart';
import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _slugController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _slugController = TextEditingController();
    _descriptionController = TextEditingController();
    _imageUrlController = TextEditingController();
  }

  String? _previewImageUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _slugController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updatePreviewImage() {
    setState(() {
      _previewImageUrl = _imageUrlController.text;
    });
  }

  void _onNameChanged(String value) {
    if (_slugController.text.isEmpty) {
      _slugController.text = value.toLowerCase().replaceAll(
        RegExp(r'\s+'),
        '-',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainShell(
      selectedRoute: AppRoute.categories,
      onRouteChanged: (route) {
        if (route != AppRoute.categories) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (_, _, _) => MainScreen(initialRoute: route),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
            (route) => false,
          );
        }
      },
      content: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: Column(
          children: [
            PageHeader(
              breadcrumbTrail: const [
                'Dashboard',
                'Categories',
                'Add Category',
              ],
              onBreadcrumbTap: (index) {
                if (index < 2) {
                  Navigator.pop(context);
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add Category',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create a new product category to organize your inventory.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        const SizedBox(height: 32),
                        CategoryInfoSection(
                          nameController: _nameController,
                          slugController: _slugController,
                          descriptionController: _descriptionController,
                          onNameChanged: _onNameChanged,
                        ),
                        const SizedBox(height: 24),
                        CategoryMediaSection(
                          imageUrlController: _imageUrlController,
                          previewImageUrl: _previewImageUrl,
                          onFetch: _updatePreviewImage,
                        ),
                        const SizedBox(height: 24),
                        _buildFooterActions(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              side: BorderSide(color: Colors.grey.shade300),
              backgroundColor: ColorsManager.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF374151)),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.blue,
              foregroundColor: ColorsManager.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
            ),
            child: const Text('Create Category'),
          ),
        ],
      ),
    );
  }
}
