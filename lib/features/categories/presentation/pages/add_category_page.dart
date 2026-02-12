import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:admin_dashboard/core/shell/main_screen.dart';
import 'package:admin_dashboard/core/validators/validators.dart';
import 'package:admin_dashboard/core/widgets/main_shell.dart';
import 'package:admin_dashboard/core/widgets/page_header.dart';
import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_state.dart';
import 'package:admin_dashboard/features/categories/presentation/widgets/add_category_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryPage extends StatefulWidget {
  final Category? category;
  const AddCategoryPage({super.key, this.category});

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
    _nameController = TextEditingController(text: widget.category?.name);
    _slugController = TextEditingController(text: widget.category?.slug);
    _descriptionController = TextEditingController(
      text: widget.category?.description,
    );
    _imageUrlController = TextEditingController(
      text: widget.category?.imageUrl,
    );
    if (widget.category != null) {
      _previewImageUrl = widget.category?.imageUrl;
    }
  }

  String? _previewImageUrl;

  String? _nameError;
  String? _slugError;
  String? _imageUrlError;

  bool _validate() {
    setState(() {
      _nameError = Validators.required(
        _nameController.text,
        fieldName: 'Category name',
      );
      _slugError = Validators.slug(_slugController.text, requiredField: true);
      _imageUrlError = Validators.url(_imageUrlController.text);
    });

    return _nameError == null && _slugError == null && _imageUrlError == null;
  }

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

  void _onNameChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.category != null;
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
      content: BlocListener<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          if (state is CategoriesAdded) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  isEditing
                      ? 'Category updated successfully!'
                      : 'Category added successfully!',
                ),
              ),
            );
          } else if (state is CategoriesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: Column(
            children: [
              PageHeader(
                breadcrumbTrail: [
                  'Dashboard',
                  'Categories',
                  isEditing ? 'Edit Category' : 'Add Category',
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
                          Text(
                            isEditing ? 'Edit Category' : 'Add Category',
                            style: TextStyleManager.interBold,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            isEditing
                                ? 'Update the details of your product category.'
                                : 'Create a new product category to organize your inventory.',
                            style: TextStyleManager.interRegular,
                          ),
                          const SizedBox(height: 32),
                          CategoryInfoSection(
                            nameController: _nameController,
                            slugController: _slugController,
                            descriptionController: _descriptionController,
                            onNameChanged: _onNameChanged,
                            nameError: _nameError,
                            slugError: _slugError,
                          ),
                          const SizedBox(height: 24),
                          CategoryMediaSection(
                            imageUrlController: _imageUrlController,
                            previewImageUrl: _previewImageUrl,
                            onFetch: _updatePreviewImage,
                            imageUrlError: _imageUrlError,
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
      ),
    );
  }

  Widget _buildFooterActions(BuildContext context) {
    final isEditing = widget.category != null;
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
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              backgroundColor: Color(0xFFEFF6FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyleManager.interMedium.copyWith(
                color: ColorsManager.blue,
              ),
            ),
          ),
          const SizedBox(width: 12),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              final isSubmitting = state is CategoriesAdding;
              return ElevatedButton(
                onPressed: isSubmitting
                    ? null
                    : () {
                        if (!_validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please fix the errors before saving',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        final category = Category(
                          id: isEditing
                              ? widget.category!.id
                              : DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                          name: _nameController.text.trim(),
                          slug: _slugController.text.trim(),
                          description: _descriptionController.text.trim(),
                          itemsCount: widget.category?.itemsCount ?? 0,
                          imageUrl: _imageUrlController.text.trim(),
                          updatedAt: DateTime.now(),
                        );
                        if (isEditing) {
                          context.read<CategoriesCubit>().updateCategory(
                            category,
                          );
                        } else {
                          context.read<CategoriesCubit>().addCategory(category);
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.blue,
                  foregroundColor: ColorsManager.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                ),
                child: isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(isEditing ? 'Save Changes' : 'Create Category'),
              );
            },
          ),
        ],
      ),
    );
  }
}
