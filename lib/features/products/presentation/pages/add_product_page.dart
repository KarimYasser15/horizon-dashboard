import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/di/service_locator.dart';
import 'package:admin_dashboard/core/shell/main_screen.dart';
import 'package:admin_dashboard/core/widgets/main_shell.dart';
import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:admin_dashboard/features/products/domain/entities/product.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/add_product_cubit.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/add_product_state.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/general_info_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/media_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/pricing_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/status_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/organization_section.dart';
import 'package:admin_dashboard/features/products/presentation/widgets/add_product/preview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key, this.product});

  final Product? product;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
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
    _nameController = TextEditingController(text: widget.product?.name);
    _descriptionController = TextEditingController(
      text: widget.product?.description,
    );
    _imageUrlController = TextEditingController(text: widget.product?.imageUrl);
    _basePriceController = TextEditingController(
      text: widget.product?.price.toString(),
    );
    _compareAtPriceController = TextEditingController(
      text: widget.product?.compareAtPrice?.toString(),
    );
    _quantityController = TextEditingController(
      text: widget.product?.quantity.toString(),
    );
    _skuController = TextEditingController(text: widget.product?.sku);
    _productTypeController = TextEditingController(
      text: widget.product?.variant,
    );
    _tagsController = TextEditingController(
      text: widget.product?.tags.join(', '),
    );

    if (widget.product != null) {
      _category = widget.product!.category;
      _previewImageUrl = widget.product!.imageUrl;
    }
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

  void _saveProduct(BuildContext context) {
    if (_nameController.text.isEmpty || _category == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in required fields (Name, Category)'),
        ),
      );
      return;
    }

    final product = Product(
      id: widget.product?.id ?? '',
      name: _nameController.text,
      variant: _productTypeController.text,
      category: _category!,
      price: double.tryParse(_basePriceController.text) ?? 0.0,
      compareAtPrice: double.tryParse(_compareAtPriceController.text),
      quantity: int.tryParse(_quantityController.text) ?? 0,
      description: _descriptionController.text,
      imageUrl: _imageUrlController.text,
      sku: _skuController.text,
      tags: _tagsController.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
    );

    if (widget.product == null) {
      context.read<AddProductCubit>().addProduct(product);
    } else {
      context.read<AddProductCubit>().updateProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddProductCubit>(),
      child: BlocListener<AddProductCubit, AddProductState>(
        listener: (context, state) {
          if (state is AddProductLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is AddProductSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product added successfully')),
            );
            context.read<ProductsCubit>().loadProducts();
            Navigator.pop(context);
          } else if (state is AddProductError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        child: MainShell(
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
                  breadcrumbTrail: [
                    'Dashboard',
                    'Products',
                    widget.product == null ? 'Add Product' : 'Edit Product',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) => _buildHeaderActions(context),
                        ),
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
                                          imageUrlController:
                                              _imageUrlController,
                                          onFetch: _updatePreviewImage,
                                        ),
                                        const SizedBox(height: 24),
                                        PricingSection(
                                          basePriceController:
                                              _basePriceController,
                                          compareAtPriceController:
                                              _compareAtPriceController,
                                          quantityController:
                                              _quantityController,
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
                                        PreviewSection(
                                          imageUrl: _previewImageUrl,
                                        ),
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
                                    productTypeController:
                                        _productTypeController,
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
        ),
      ),
    );
  }

  Widget _buildHeaderActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.product == null ? 'Add New Product' : 'Edit Product',
          style: const TextStyle(
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
              onPressed: () => _saveProduct(context),
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
