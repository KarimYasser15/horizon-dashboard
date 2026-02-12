import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:flutter/material.dart';

class TableSearchControls extends StatelessWidget {
  const TableSearchControls({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildSearchField(),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildFilterButton()),
                        const SizedBox(width: 8),
                        Expanded(child: _buildExportButton()),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: _buildSearchField()),
                    const SizedBox(width: 12),
                    _buildFilterButton(),
                    const SizedBox(width: 8),
                    _buildExportButton(),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF9CA3AF),
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: ColorsManager.blue,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      onChanged: onSearchChanged,
    );
  }

  Widget _buildFilterButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.tune, size: 18),
      label: const Text('Filter'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }

  Widget _buildExportButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.download, size: 18),
      label: const Text('Export'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}
