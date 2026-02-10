import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/shell/main_screen.dart';
import 'package:admin_dashboard/core/widgets/main_shell.dart';
import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/general_info_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/media_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/pricing_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/status_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/organization_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/preview_section.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  // Form controllers
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imageUrlController;
  late final TextEditingController _basePriceController;
  late final TextEditingController _compareAtPriceController;
  late final TextEditingController _quantityController;
  late final TextEditingController _skuController;
  late final TextEditingController _productTypeController;
  late final TextEditingController _tagsController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _imageUrlController = TextEditingController();
    _basePriceController = TextEditingController();
    _compareAtPriceController = TextEditingController();
    _quantityController = TextEditingController();
    _skuController = TextEditingController();
    _productTypeController = TextEditingController();
    _tagsController = TextEditingController();
  }

  // State
  String _status = 'Active';
  String? _category;
  String? _previewImageUrl;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _basePriceController.dispose();
    _compareAtPriceController.dispose();
    _quantityController.dispose();
    _skuController.dispose();
    _productTypeController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _updatePreviewImage() {
    setState(() {
      _previewImageUrl = _imageUrlController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainShell(
      selectedRoute: AppRoute.products,
      onRouteChanged: (route) {
        if (route != AppRoute.products) {
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
              breadcrumbTrail: const ['Dashboard', 'Products', 'Add Product'],
              onBreadcrumbTap: (index) {
                if (index < 2) {
                  Navigator.pop(context);
                }
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderActions(context),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 1000) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    GeneralInfoSection(
                                      nameController: _nameController,
                                      descriptionController:
                                          _descriptionController,
                                    ),
                                    const SizedBox(height: 24),
                                    MediaSection(
                                      imageUrlController: _imageUrlController,
                                      onFetch: _updatePreviewImage,
                                    ),
                                    const SizedBox(height: 24),
                                    PricingSection(
                                      basePriceController: _basePriceController,
                                      compareAtPriceController:
                                          _compareAtPriceController,
                                      quantityController: _quantityController,
                                      skuController: _skuController,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    StatusSection(
                                      status: _status,
                                      onChanged: (val) =>
                                          setState(() => _status = val!),
                                    ),
                                    const SizedBox(height: 24),
                                    OrganizationSection(
                                      category: _category,
                                      onCategoryChanged: (val) =>
                                          setState(() => _category = val),
                                      productTypeController:
                                          _productTypeController,
                                      tagsController: _tagsController,
                                    ),
                                    const SizedBox(height: 24),
                                    PreviewSection(imageUrl: _previewImageUrl),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              GeneralInfoSection(
                                nameController: _nameController,
                                descriptionController: _descriptionController,
                              ),
                              const SizedBox(height: 24),
                              MediaSection(
                                imageUrlController: _imageUrlController,
                                onFetch: _updatePreviewImage,
                              ),
                              const SizedBox(height: 24),
                              PricingSection(
                                basePriceController: _basePriceController,
                                compareAtPriceController:
                                    _compareAtPriceController,
                                quantityController: _quantityController,
                                skuController: _skuController,
                              ),
                              const SizedBox(height: 24),
                              StatusSection(
                                status: _status,
                                onChanged: (val) =>
                                    setState(() => _status = val!),
                              ),
                              const SizedBox(height: 24),
                              OrganizationSection(
                                category: _category,
                                onCategoryChanged: (val) =>
                                    setState(() => _category = val),
                                productTypeController: _productTypeController,
                                tagsController: _tagsController,
                              ),
                              const SizedBox(height: 24),
                              PreviewSection(imageUrl: _previewImageUrl),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Add New Product',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111827),
          ),
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                backgroundColor: ColorsManager.white,
                side: BorderSide(color: Colors.grey.shade300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Discard',
                style: TextStyle(color: Color(0xFF374151)),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save_outlined, size: 18),
              label: const Text('Save Product'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.blue,
                foregroundColor: ColorsManager.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
